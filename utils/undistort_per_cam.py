import os
import json
import numpy as np
import cv2 as cv

from argparse import ArgumentParser


def undistort(root, start, num_frames):

    output = os.path.join(root, 'calib', 'transforms.json')
    f = open(os.path.join(root, 'calib', 'transforms_optim.json'))
    remove_list = [2, 3, 5, 11, 12, 13, 20, 21, 22, 29, 30, 31]
    jd = json.load(f)
    tmp = []
    for i in range(len(jd['frames'])):
        #print(jd['frames'][i]['file_path'])
        path = jd['frames'][i]['file_path']
        cam, time = path.split('/')[-2:]
        cam = int(cam[-2:])
        if cam not in remove_list:
            tmp.append(jd['frames'][i])
    jd['frames'] = tmp
    
    x_s = []
    y_s = []
    w_s = []
    h_s = []
    dst_paths = []
    dst_s = []
    new_poses = []
    #TODO
    #Increae efficiency by removing for loops
    for i in range(len(jd['frames'])):
        #print(jd['frames'][i]['file_path'])
        fx = jd['frames'][i]['fl_x']
        fy = jd['frames'][i]['fl_y']
        cx = jd['frames'][i]['cx']
        cy = jd['frames'][i]['cy']
        pose = np.array([[fx, 0, cx], [0, fy, cy], [0, 0, 1]])
        k1 = jd['frames'][i]['k1']
        k2 = jd['frames'][i]['k2']
        p1 = jd['frames'][i]['p1']
        p2 = jd['frames'][i]['p2']
        dist = np.array([k1, k2, p1, p2, 0., 0., 0., 0.,])
        # update pose
        new_pose, roi = cv.getOptimalNewCameraMatrix(pose, dist, [1280, 720], 1, [1280, 720])
        new_poses.append(new_pose)
        x, y, w, h = roi
        x_s.append(x)
        y_s.append(y)
        w_s.append(w)
        h_s.append(h)
        for j in range(start, num_frames+start, 1):
            path = jd['frames'][i]['file_path']
            cam, time = path.split('/')[-2:]
            time = time.split('.')[0]
            time = int(time.split('.')[0])+j
            src = cv.imread(os.path.join(root, "segmented_ngp", f"{cam}", f"{time:08d}.png"), cv.IMREAD_UNCHANGED)
            dst = cv.undistort(src, pose, dist, None, new_pose)
            dst_path = os.path.join(root, "undist", f"{cam}")
            if not os.path.isdir(dst_path):
                os.makedirs(dst_path)
            dst_paths.append(os.path.join(dst_path, f"{time:08d}.png"))
            dst_s.append(dst)
            #cv.imwrite(os.path.join(dst_path, f"{time:04d}.png"), dst)


    max_x = max(x_s)
    max_y = max(y_s)
    min_w = min(w_s)
    min_h = min(h_s)
    if min_w%2 == 1:
        min_w -= 1
    if min_h%2 == 1:
        min_h -= 1
    for i in range(len(jd['frames'])):
        new_pose = new_poses[i]
        for j in range(0, num_frames, 1):
            dst = dst_s[num_frames*i+j][max_y:max_y+min_h, max_x:max_x+min_w]
            dst_path = dst_paths[num_frames*i+j]
            print(dst_path)
            cv.imwrite(dst_path, dst)
        jd['frames'][i]['fl_x'] = new_pose[0, 0]
        jd['frames'][i]['fl_y'] = new_pose[1, 1]
        jd['frames'][i]['camera_angle_x'] = 2 * np.arctan2(min_w, 2*new_pose[0, 0])
        jd['frames'][i]['camera_angle_y'] = 2 * np.arctan2(min_h, 2*new_pose[1, 1])
        jd['frames'][i]['cx'] = new_pose[0, 2]-max_x
        jd['frames'][i]['cy'] = new_pose[1, 2]-max_y
        jd['frames'][i]['w'] = min_w
        jd['frames'][i]['h'] = min_h
        # remove k1k2p1p2
        del jd['frames'][i]['k1']
        del jd['frames'][i]['k2']
        del jd['frames'][i]['p1']
        del jd['frames'][i]['p2']
        # update path
        jd['frames'][i]['file_path'] = os.path.join('undist', os.path.join(*dst_paths[num_frames*i].split('/')[-2:]))

    print(f"writing {output}")
    with open(output, "w") as outfile:
        json.dump(jd, outfile, indent=2)


if __name__ == "__main__":
    parser = ArgumentParser()
    parser.add_argument("--root", required=True, help="Object folder")
    parser.add_argument("--start", type=int, default=0)
    parser.add_argument("--num_frames", type=int, default=1)
    args = parser.parse_args()

    undistort(args.root, args.start, args.num_frames)
