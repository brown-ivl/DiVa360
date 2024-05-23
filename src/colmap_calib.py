"""
This script extracts camera extrinsics and intrinsics using COLMAP.

The directory structure of the root directory should be as follows:
root_dir
|   |   *cam*
|   |   |   image_*.jpg

Run the script using:
    python colmap_params.py -r <root_dir>

The parameters will be stored in <root_dir>/params.txt.
"""

import os
import logging
import subprocess
import sqlite3
import numpy as np
import cv2
import shutil
from numpy.lib import recfunctions as rf
from tqdm import tqdm
from cv2 import aruco
from glob import glob
from argparse import ArgumentParser

logging.getLogger().setLevel(logging.INFO)

MARKER_AREA_THRESHOLD = 800 #1000 # Parameter
MAX_IMAGE_ID = 2**31 - 1

debug = False

tmp_dir = os.path.join("/tmp", "brics_calib")

def create_dir(path: str):
    """ Creates a directory also deleting previous one if it exissts """
    logging.warning(f"Deleting files at {path}")
    try:
        shutil.rmtree(path)
    except:
        pass
    os.makedirs(path)

def image_ids_to_pair_id(image_id1, image_id2):
    if image_id1 > image_id2:
        image_id1, image_id2 = image_id2, image_id1
    return image_id1 * MAX_IMAGE_ID + image_id2

def array_to_blob(array):
    return array.tobytes()

def blob_to_array(blob, dtype, shape=(-1,)):
    return np.frombuffer(blob, dtype=dtype).reshape(*shape)

def get_images(args, db_path, image_dir):
    connection = sqlite3.connect(db_path)
    cursor = connection.cursor()
    cursor.execute("SELECT image_id,name FROM images;")
    image_ids, image_paths = zip(*cursor.fetchall())
    image_ids = list(image_ids)
    image_paths = [os.path.join(image_dir, image_path) for image_path in image_paths]
    cursor.close()
    connection.close()
    return image_ids, image_paths

def add_features(image_ids, image_paths, db_path):
    # IMPORTANT: Change this if dictionary is changed
    aruco_dict = aruco.getPredefinedDictionary(aruco.DICT_4X4_250)  # Using few bits per marker for better detection
    parameters = aruco.DetectorParameters()
    detector = aruco.ArucoDetector(aruco_dict, parameters)
    criteria = (cv2.TERM_CRITERIA_EPS + cv2.TERM_CRITERIA_MAX_ITER, 100, 0.0001) # Sub-pixel detection

    connection = sqlite3.connect(db_path)
    cursor = connection.cursor()
    cursor.execute("DELETE FROM keypoints;")
    cursor.execute("DELETE FROM descriptors;")
    cursor.execute("DELETE FROM matches;")
    connection.commit()

    logging.info("Extracting features from ChArUco")
    image_id_desc = {}
    for image_id, image_path in tqdm(list(zip(image_ids, image_paths))):
        frame = cv2.imread(image_path)

        gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
        orig_corners, orig_ids, _ = detector.detectMarkers(gray)

        if len(orig_corners) <= 0:
            logging.warning("No markers found in {image_path}")
            continue
        else:
            corners = []
            ids = []
            for (corner, id) in zip(orig_corners, orig_ids):
                area = cv2.contourArea(corner)
                if area >= MARKER_AREA_THRESHOLD:  # PARAM
                    ids.append(id)
                    corners.append(corner)

            if len(orig_corners) - len(corners) > 0:
                logging.warning(f'Ignoring {len(orig_corners) - len(corners)} sliver markers.')

            ids = np.asarray(ids).flatten()
            # ipdb.set_trace()
            uniq, cnt = np.unique(ids, return_counts=True)
            if np.any(cnt > 1):
                if debug:
                    frame_markers = aruco.drawDetectedMarkers(frame.copy(), corners, ids)
                    cv2.imshow("Duplicate markers", frame_markers)
                    ch = cv2.waitKey(0)
                    if ch == 27:
                        exit()
                logging.warning(f"{np.count_nonzero(cnt > 1)} duplicate IDs found, ignoring")

            non_uniq = dict(zip(uniq, cnt))

            uniq_corners = []
            uniq_ids = []
            for i in range(len(corners)):
                # Skip if ID is non-unique
                if non_uniq[ids[i]] > 1:
                    continue

                if np.all(corners[i] >= 0):
                    cv2.cornerSubPix(gray, corners[i], winSize=(3, 3), zeroZone=(-1, -1), criteria=criteria)
                    corners[i] = corners[i].squeeze()
                    uniq_ids.append(ids[i])
                    uniq_corners.append(corners[i])
                else:
                    raise NotImplementedError

            ids = np.asarray(uniq_ids)
            uniq, cnt = np.unique(ids, return_counts=True)

            # Insert keypoints
            keypoints = np.concatenate(uniq_corners)
            cursor.execute(
                "INSERT INTO keypoints VALUES (?, ?, ?, ?)",
                (image_id,) + keypoints.shape + (array_to_blob(keypoints.astype(np.float32)),)
            )

            ids = np.repeat(ids, 4)
            for i in range(4):
                # TODO: Find a more elegant solution for this
                ids[i::4] += (i*1000)
            image_id_desc[image_id] = ids

        connection.commit()

    cursor.close()
    connection.close()
    return image_id_desc

def exhaustive_match(image_ids, image_paths, db_path, args, image_id_desc, image_dir):
    connection = sqlite3.connect(db_path)
    cursor = connection.cursor()
    cursor.execute("DELETE FROM matches;")
    connection.commit()

    logging.info("Matching features")
    image_pairs = []
    for i in tqdm(range(len(image_ids))):
        for j in range(len(image_ids)):
            if image_ids[i] >= image_ids[j]:
                continue

            desc1 = image_id_desc[image_ids[i]]
            desc2 = image_id_desc[image_ids[j]]

            # Find matches
            matches = []
            for k in range(desc1.shape[0]):
                for l in range(desc2.shape[0]):
                    if desc1[k] == desc2[l]:
                        matches.append([k, l])

            # Insert into database
            pair_id = image_ids_to_pair_id(image_ids[i], image_ids[j])
            if not matches:
                continue

            image_pairs.append([image_paths[i], image_paths[j]])
            matches = np.asarray(matches, np.uint32)

            cursor.execute("INSERT INTO matches VALUES (?, ?, ?, ?)",
                           (pair_id,) + matches.shape + (array_to_blob(matches),))

            connection.commit()

    cursor.close()
    connection.close()

    match_list_path = os.path.join(tmp_dir, "match_list.txt")
    logging.info(f"Writing image pairs at {match_list_path}")
    with open(os.path.join(match_list_path), "w") as f:
        for pair in image_pairs:
            f.write((" ".join(pair)).replace(image_dir + "/", "") + "\n")

def main(args):
    db_path = os.path.join(tmp_dir, "db.db")
    input_image_path = os.path.join(args.root_dir)

    image_path = os.path.join(tmp_dir, "images")
    create_dir(image_path)

    image_dirs = list(sorted(glob(f"{input_image_path}/*cam*")))
    for image_dir in image_dirs:
        to_copy = os.path.basename(sorted(glob(f"{image_dir}/*.jpg"))[0])
        os.makedirs(os.path.join(image_path, os.path.basename(image_dir)))
        shutil.copyfile(os.path.join(image_dir, to_copy),
                        os.path.join(image_path, os.path.basename(image_dir), to_copy))
    
    if os.path.exists(db_path):
        logging.warning("Previous database found, deleting.")
        os.remove(db_path)
        try:
            os.remove(os.path.join(tmp_dir, "db.db-wal"))
            os.remove(os.path.join(tmp_dir, "db.db-shm"))
        except FileNotFoundError:
            pass

    logging.info("Importing images in database")
    subprocess.run([
        "colmap", "feature_extractor",
        "--database_path", db_path,
        "--image_path", image_path,
        "--ImageReader.single_camera_per_folder", "1",
        "--ImageReader.camera_model", "OPENCV"]
    )

    image_ids, image_paths = get_images(args, db_path, input_image_path)
    image_id_desc = add_features(image_ids, image_paths, db_path)
    exhaustive_match(image_ids, image_paths, db_path, args, image_id_desc, input_image_path)

    logging.info("Performing geometric verification")
    subprocess.run([
        "colmap", "matches_importer",
        "--database_path", db_path,
        "--match_list_path", f"{os.path.join(tmp_dir, 'match_list.txt')}",
        "--match_type", "pairs",
        "--SiftMatching.min_num_inliers", "1"
    ])

    logging.info("Reconstructing")
    recon_path = os.path.join(tmp_dir, "reconstruction")
    create_dir(recon_path)
    subprocess.run([
        "colmap", "mapper",
        "--database_path", db_path,
        "--image_path", image_path,
        "--output_path", recon_path,
    ])

    logging.info("Performing global bundle adjustment")
    subprocess.run([
        "colmap", "bundle_adjuster",
        "--input_path", os.path.join(recon_path, "0"),
        "--output_path", os.path.join(recon_path, "0"),
        "--BundleAdjustment.refine_principal_point", "1",
        "--BundleAdjustment.max_num_iterations", "1000"
    ])

    output_dir = os.path.join(tmp_dir, "output")
    create_dir(output_dir)
    subprocess.run([
        "colmap", "model_converter",
        "--input_path", os.path.join(recon_path, "0"),
        "--output_path", output_dir,
        "--output_type", "TXT"
    ])
    # Read images
    image_params = []
    with open(os.path.join(output_dir, "images.txt")) as f:
        skip_next = False
        for line in f.readlines():
            if skip_next:
                skip_next = False
                continue
            if line.startswith("#"):
                continue
            data = line.split()
            param = []
            param.append(int(data[8]))
            param.append(data[9].split("/")[0])
            param += [float(datum) for datum in data[1:8]]
            image_params.append(tuple(param))
            skip_next = True

    images = np.array(image_params, dtype=[
        ('cam_id', int), ('cam_name', '<U22'),
        ('qvecw', float), ('qvecx', float), ('qvecy', float), ('qvecz', float),
        ('tvecx', float), ('tvecy', float), ('tvecz', float)
    ])

    # Read cameras
    cam_params = []
    with open(os.path.join(output_dir, "cameras.txt")) as f:
        for line in f.readlines():
            if line.startswith("#"):
                continue
            data = line.split()
            param = []
            param.append(int(data[0]))
            param.append(int(data[2]))
            param.append(int(data[3]))
            param += [float(datum) for datum in data[4:]]
            cam_params.append(tuple(param))
    cameras = np.array(cam_params, dtype=[
        ('cam_id', int),
        ('width', int), ('height', int),
        ('fx', float), ('fy', float),
        ('cx', float), ('cy', float),
        ('k1', float), ('k2', float),
        ('p1', float), ('p2', float),
    ])

    img_cams = rf.join_by('cam_id', cameras, images)

    np.savetxt(os.path.join(args.root_dir, 'params.txt'), img_cams, fmt="%s", header=" ".join(img_cams.dtype.fields))

    logging.warning(f"Stored the parameters at {os.path.join(args.root_dir, 'params.txt')}")

if __name__ == "__main__":
    parser = ArgumentParser()
    parser.add_argument("-r", "--root_dir", required=True, help="Base directory")

    args = parser.parse_args()

    main(args)
