# This file is modified from I-NGP run.py

import argparse
import os
import commentjson as json

import numpy as np

import shutil
import time
import sys
sys.path.append("../models/instant-ngp/build")
sys.path.append("../models/instant-ngp/scripts")
sys.path.append(".")

from common import *
from scenes import *

from tqdm import tqdm

import pyngp as ngp # noqa
import cv2


def parse_args():
    parser = argparse.ArgumentParser(description="Run per-frame I-NGP with transform_*.json")
    parser.add_argument("--scene_test_json", required=True, default="", help="Path to the .json file.")
    parser.add_argument("--near_distance", default=-1, type=float, help="Set the distance from the camera at which training rays start for nerf. <0 means use ngp default")
    parser.add_argument("--gui", action="store_true", help="Run the testbed GUI interactively.")
    parser.add_argument("--start_frame", type=int, default=0)
    parser.add_argument("--num_frames", type=int, default=1)
    parser.add_argument("--aabb", type=int, default=2)
    return parser.parse_args()

def infer_npg(args, frame):
    # load transform_*.json file
    f = open(args.scene_test_json)
    params = json.load(f)
    f.close()
    parent = os.path.split(args.scene_test_json)[0]

    # python binding
    testbed = ngp.Testbed()
    # setup root dir
    testbed.root_dir = parent
    # reload a snapshot
    snapshot_path = os.path.join(parent, 'I-NGP', 'train', f'{frame:08d}', 'per-frame.ingp')
    testbed.load_snapshot(snapshot_path)
    # initialize a dataset
    testbed.create_empty_nerf_dataset(n_images=len(params['frames']), aabb_scale=args.aabb)#params['aabb_scale'])
    imgs = []
    names = []
    # setup dataset
    for idx, param in enumerate(params['frames']):
        # TODO: Change undist to frames_1 in json file
        img_path = os.path.join(parent, 'frames_1', *param['file_path'].split(os.sep)[1:-1], f'{frame:08d}.png')
        print(img_path, idx)
        img = cv2.cvtColor(cv2.imread(img_path, cv2.IMREAD_UNCHANGED), cv2.COLOR_BGRA2RGBA)
        img = img.astype(np.float32)
        img /= 255.0
        # set_image only accepts linear color as input
        img = srgb_to_linear(img)
        names.append(param['file_path'].split(os.sep)[-2])
        height, width = img.shape[:2]
        assert (height==param['h'])
        assert (width==param['w'])
        depth_img = np.zeros((img.shape[0], img.shape[1]))
        testbed.nerf.training.set_image(idx, img, depth_img)
        testbed.nerf.training.set_camera_extrinsics(idx, param['transform_matrix'][:3], convert_to_ngp=True)
        testbed.nerf.training.set_camera_intrinsics(
            idx,
            fx=param["fl_x"], fy=param["fl_y"],
            cx=param["cx"], cy=param["cy"],
            k1=param["k1"] if "k1" in param.keys() else 0, k2=param["k2"] if "k2" in param.keys() else 0,
            p1=param["p1"] if "p1" in param.keys() else 0, p2=param["p2"] if "p2" in param.keys() else 0
        )
        imgs.append(img)

    # Enable following setting to follow NeRF paper setting 
    #testbed.color_space = ngp.ColorSpace.SRGB
    #testbed.nerf.cone_angle_constant = 0
    #testbed.nerf.training.random_bg_color = False

    # Testing
    testbed.nerf.training.n_images_for_training = len(params['frames'])
    testbed.shall_train = False
    # near plane
    if args.near_distance>=0.0:
        testbed.nerf.training.near_distance = args.near_distance
    totcount = 0
    psnr = 0
    testbed.background_color = [0.0, 0.0, 0.0, 1.0]
    testbed.snap_to_pixel_centers = True
    spp = 8
    save_root_path = os.path.join(parent, 'I-NGP', 'test')
    testbed.nerf.render_with_lens_distortion = False

    if args.gui:
        testbed.init_window(1920, 1080)
        while testbed.frame():
            if testbed.want_repl():
                ipdb.set_trace()

    # Start testing
    with tqdm(range(testbed.nerf.training.dataset.n_images), unit="images", desc=f"Rendering test frame") as t:
        for i in t:
            resolution = testbed.nerf.training.dataset.metadata[i].resolution
            testbed.set_camera_to_training_view(i)
            testbed.render_ground_truth = False
            image = testbed.render(resolution[0], resolution[1], spp, True)

            save_path = os.path.join(save_root_path, names[i])
            if not os.path.isdir(save_path):
                os.makedirs(save_path) 
            save_path = os.path.join(save_root_path, names[i], f'{frame:08d}.png')
            # write_image should only accept linear color as input
            write_image(save_path, image)
            # we should compute psnr in srgb space
            A = linear_to_srgb(image[..., :3])
            R = linear_to_srgb(imgs[i][..., :3])
            diffimg = np.absolute(A - R)
            mse = float(compute_error("MSE", A, R))
            psnr += mse2psnr(mse)
            totcount += 1

    #if args.gui:
    #    testbed.init_window(1920, 1080)
    #    while testbed.frame():
    #        if testbed.want_repl():
    #            ipdb.set_trace()

    return psnr/totcount

if __name__ == "__main__":
    start_time = time.time()
    args = parse_args()
    start = args.start_frame
    end = args.start_frame + args.num_frames
    psnr = 0
    count = 0
    for i in range(start, end, 1):
        psnr += infer_npg(args, i)
        count += 1
    print(f'Avg PSNR: {psnr/count}')
    print("--- %s seconds ---" % (time.time() - start_time))   

    if count >1:
        # load transform_*.json file
        f = open(args.scene_test_json)
        params = json.load(f)
        f.close()
        parent = os.path.split(args.scene_test_json)[0]
        save_root_path = os.path.join(parent, 'I-NGP', 'test')
        for param in params['frames']:
            name = param['file_path'].split(os.sep)[-2]
            save_path = os.path.join(save_root_path, name)       
            os.system(f"ffmpeg -y -framerate 30 -i {save_path}/%08d.png -b:v 20M -c:v libx264 {save_root_path}/{name}.mp4")

