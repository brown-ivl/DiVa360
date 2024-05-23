import os
import sys
sys.path.append("../models/instant-ngp/build")
sys.path.append(".")
import numpy as np
import pyngp as ngp
import cv2
import time
import json
import ipdb
from tqdm import tqdm
from natsort import natsorted
from glob import glob
from argparse import ArgumentParser
from scipy.spatial.distance import cdist
import utils.params as param_utils
import matplotlib.pyplot as plt
from scipy.spatial.transform import Rotation


def get_parser():
    parser = ArgumentParser()
    parser.add_argument("--root_dir", type=str, required=True)
    parser.add_argument("--network", type=str, required=True)
    parser.add_argument("--roi", nargs=3, default=[0.5, 0.5, 0.5], type=float)
    parser.add_argument("--gui", action="store_true")
    parser.add_argument("--face_to_cam", action="store_true")
    parser.add_argument("--aabb_scale", type=int, default=1)
    parser.add_argument("--optimize_params", action="store_true")
    parser.add_argument("--save_segmented_images", action="store_true")
    parser.add_argument("--cam_faces_path", type=str, default="./metadata/faces.json")
    parser.add_argument("--face_to_cam_path", type=str, default="./metadata/faceToCam.json")
    parser.add_argument("--n_steps", nargs="+", default=[3000], type=int)

    args = parser.parse_args()
    return args

def refine_params(testbed, roi, params, c2ws, frame_num, base_path, args, output_path):
    testbed.reload_network_from_file(args.network)
    testbed.create_empty_nerf_dataset(n_images=len(params), aabb_scale=args.aabb_scale)

    # Upload images to I-NGP
    imgs = []
    image_dir = os.path.join(base_path, "image")
    for idx, param in enumerate(params):
        img_list = natsorted(glob(f"{image_dir}/{param['cam_name']}/*.[jp][pn]g"))
        img = cv2.cvtColor(cv2.imread(img_list[frame_num], cv2.IMREAD_UNCHANGED), cv2.COLOR_BGRA2RGBA)
        img = img.astype(np.float32)
        depth_img = np.zeros((img.shape[0], img.shape[1]))
        img /= 255
        height, width = img.shape[:2]
        c2w = c2ws[idx]
        testbed.nerf.training.set_image(idx, img, depth_img)
        testbed.nerf.training.set_camera_extrinsics(idx, c2w[:3], convert_to_ngp=False)
        testbed.nerf.training.set_camera_intrinsics(
            idx,
            fx=param["fx"], fy=param["fy"],
            cx=param["cx"], cy=param["cy"],
            k1=param["k1"], k2=param["k2"],
            p1=param["p1"], p2=param["p2"]
        )
        imgs.append(img)
        idx +=1

    # Taken from i-ngp:scripts/run.py
    testbed.color_space = ngp.ColorSpace.SRGB
    testbed.nerf.cone_angle_constant = 0
    testbed.nerf.visualize_cameras = True
    testbed.nerf.training.random_bg_color = True
    # Set alpha to 0 to get accumulation value
    testbed.background_color = [0.0, 0.0, 0.0, 0.0]

    testbed.nerf.training.n_images_for_training = len(params)

    opening_kernel = cv2.getStructuringElement(cv2.MORPH_ELLIPSE, (7, 7))

    # Train
    total_n_steps = args.n_steps[0]
    if args.optimize_params:
        print(f"Optimizing Camera Parameters !!")
        print("--------------------------------------------")
        testbed.nerf.training.optimize_extrinsics = True
        # disable this since we are not going to update this in .txt or .json
        testbed.nerf.training.optimize_focal_length = False #True
        testbed.nerf.training.optimize_distortion = False #True

    size = 1
    testbed.shall_train = True
    old_training_step = 0
    tqdm_last_update = 0
        
    if total_n_steps > 0:
        with tqdm(desc="Training", total=total_n_steps, unit="step") as t:
            while testbed.frame():
                # What will happen when training is done?
                if testbed.training_step >= total_n_steps:
                    break

                # Update progress bar
                now = time.monotonic()
                if now - tqdm_last_update > 0.1:
                    t.update(testbed.training_step - old_training_step)
                    t.set_postfix(loss=testbed.loss)
                    old_training_step = testbed.training_step
                    tqdm_last_update = now
                    
    if len(args.n_steps) > 1:
        if i != len(args.n_steps) - 1:
            n_steps = args.n_steps[i+1]
        total_n_steps += n_steps
    
    testbed.shall_train = False

    if args.gui:
        testbed.init_window(1920, 1080)
        while testbed.frame():
            if testbed.want_repl():
                ipdb.set_trace()
        



def main():
    args = get_parser()

    with open(args.cam_faces_path, "r") as f:
        faces = json.load(f)
    
    face_to_cam = None
    if args.face_to_cam:
        with open(args.face_to_cam_path, "r") as f:
            face_to_cam = json.load(f)
        for face in faces:
            if faces[face]['center'] != '':
                faces[face]['center'] = face_to_cam[faces[face]['center']]
            for i, cam in enumerate(faces[face]['cameras']):
                faces[face]['cameras'][i] = face_to_cam[cam]

    base_path = args.root_dir
    
    params_name = "params.txt"

    params_path = os.path.join(args.root_dir, params_name)
    
    params = param_utils.read_params(params_path)
    fields = params.dtype.fields

    if args.face_to_cam:
        for i, param in enumerate(params):
            if param['cam_name'] in face_to_cam.keys():
                param['cam_name'] = face_to_cam[param['cam_name']]
    
    # Create output directory
    output_path = os.path.join(base_path, "segmented_ngp")
    os.makedirs(output_path, exist_ok=True)

    # Canocalize the capture system
    cam2idx = {}
    pos = []
    rot = []
    
    for idx, param in enumerate(params):
        w2c = param_utils.get_extr(param)
        w2c = np.vstack((w2c, np.asarray([[0, 0, 0, 1]])))
        c2w = np.linalg.inv(w2c)
        cam2idx[param["cam_name"]] = idx

        pos.append(c2w[:3,3])
        rot.append(c2w[:3,:3])

        os.makedirs(os.path.join(output_path, param["cam_name"]), exist_ok=True)

    pos = np.stack(pos)
    rot = np.stack(rot)

    roi = args.roi

    center = pos.mean(axis=0)
    max_dist = cdist(pos, pos).max()

    # Move center of scene to [0, 0, 0]
    pos -= center

    axs = np.zeros((3, 3))

    # Rotate to align bounding box
    for idx, dir_ in enumerate([
        ["1 0 0", "-1 0 0"],
        ["0 1 0", "0 -1 0"],
        ["0 0 1", "0 0 -1"],
    ]):
        avg1 = []
        for camera in faces[dir_[0]]["cameras"]:
            avg1.append(pos[cam2idx[camera]])
        avg2 = []
        for camera in faces[dir_[1]]["cameras"]:
            avg2.append(pos[cam2idx[camera]])
        axs[idx] = np.asarray(avg1).mean(axis=0) - np.asarray(avg2).mean(axis=0)
        axs[idx] /= np.linalg.norm(axs[idx])

    # Get closest orthormal basis
    u, _, v = np.linalg.svd(axs)
    orth_axs = u @ v

    new_pos = (orth_axs @ pos.T).T
    new_rot = orth_axs @ rot

    # Scale to fit diagonal in unity cube
    scale_factor = np.sqrt(2) / max_dist * 0.9
    new_pos *= scale_factor

    # Move center of scene to [0.5, 0.5, 0.5]
    new_pos += 0.5

    c2ws = np.zeros((new_pos.shape[0], 4, 4))
    c2ws[:,:3,:3] = new_rot
    c2ws[:,:3,3] = new_pos
    c2ws[:,3,3] = 1

    testbed = ngp.Testbed(ngp.TestbedMode.Nerf)
    refine_params(testbed, roi, params, c2ws, 0, base_path, args, output_path)

    # if args.optimize_params:
    optim_params = params.copy()
    for idx, param in enumerate(params):
            c2w = testbed.nerf.training.get_camera_extrinsics(idx, convert_to_ngp = False)
            c2w = np.vstack((c2w, np.asarray([[0, 0, 0, 1]])))
            w2c = np.linalg.inv(c2w)
            qvec = Rotation.from_matrix(w2c[:3,:3]).as_quat()
            tvec = w2c[:3,3]
            optim_params[idx]["qvecx"] = qvec[0]
            optim_params[idx]["qvecy"] = qvec[1]
            optim_params[idx]["qvecz"] = qvec[2]
            optim_params[idx]["qvecw"] = qvec[3]
            optim_params[idx]["tvecx"] = tvec[0]
            optim_params[idx]["tvecy"] = tvec[1]
            optim_params[idx]["tvecz"] = tvec[2]
            
    np.savetxt(os.path.join(os.path.dirname(params_path), 'optim_params.txt'), optim_params, fmt="%s", header=" ".join(fields))

if __name__ == '__main__':
    main()
