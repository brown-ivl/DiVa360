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
    parser.add_argument("--suffix", default="")
    return parser.parse_args()

def infer_npg(args, frame, param, t_step):
    parent = os.path.split(args.scene_test_json)[0]
    # python binding
    testbed = ngp.Testbed()
    # setup root dir
    testbed.root_dir = parent
    # reload a snapshot
    snapshot_path = os.path.join(parent, 'I-NGP', 'train', f'{frame//t_step:08d}', 'per-frame.ingp')
    testbed.load_snapshot(snapshot_path)
    # initialize a dataset
    testbed.create_empty_nerf_dataset(n_images=1, aabb_scale=args.aabb)#params['aabb_scale'])
    imgs = []
    height, width = param['h'], param['w']
    img = np.zeros((height, width, 4))
    depth_img = np.zeros((img.shape[0], img.shape[1]))
    testbed.nerf.training.set_image(0, img, depth_img)
    testbed.nerf.training.set_camera_extrinsics(0, param['transform_matrix'][:3], convert_to_ngp=True)
    testbed.nerf.training.set_camera_intrinsics(
        0,
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
    testbed.nerf.training.n_images_for_training = 1
    testbed.shall_train = False
    # near plane
    if args.near_distance>=0.0:
        testbed.nerf.training.near_distance = args.near_distance
    testbed.background_color = [0.0, 0.0, 0.0, 1.0]
    testbed.snap_to_pixel_centers = True
    spp = 8
    save_root_path = os.path.join(parent, 'I-NGP', 'traj')
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

            save_path = os.path.join(save_root_path, f'cams{args.suffix}')
            if not os.path.isdir(save_path):
                os.makedirs(save_path) 
            save_path = os.path.join(save_root_path, f'cams{args.suffix}', f'{frame:08d}.png')
            # write_image should only accept linear color as input
            write_image(save_path, image)

    #if args.gui:
    #    testbed.init_window(1920, 1080)
    #    while testbed.frame():
    #        if testbed.want_repl():
    #            ipdb.set_trace()

if __name__ == "__main__":
    args = parse_args()
    # load transform_*.json file
    f = open(args.scene_test_json)
    params = json.load(f)
    t_step = int(0.5+len(params['frames'])/args.num_frames)
    print('Step', t_step)
    for i in range(len(params['frames'])):
        infer_npg(args, i, params['frames'][i], t_step)
    
    
    # load transform_*.json file
    parent = os.path.split(args.scene_test_json)[0]
    save_root_path = os.path.join(parent, 'I-NGP', 'traj')
    param = params['frames'][0]
    save_path = os.path.join(save_root_path, f'cams{args.suffix}')      
    rate = 30*t_step 
    os.system(f"ffmpeg -y -framerate {rate} -i {save_path}/%08d.png -b:v 20M -c:v libx264 {save_root_path}/cams{args.suffix}.mp4")
    f.close()

