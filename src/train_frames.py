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
    parser.add_argument("--scene_train_json", required=True, default="", help="Path to the .json file.")
    parser.add_argument("--network", default="", help="Path to the network config (e.g. base.json).")
    parser.add_argument("--near_distance", default=-1, type=float, help="Set the distance from the camera at which training rays start for nerf. <0 means use ngp default")
    parser.add_argument("--gui", action="store_true", help="Run the testbed GUI interactively.")
    parser.add_argument("--no_opt", action="store_false", help="Optimize pose and distortion.")
    parser.add_argument("--n_steps", type=int, default=2500, help="Number of steps to train for before quitting.")
    parser.add_argument("--start_frame", type=int, default=0)
    parser.add_argument("--num_frames", type=int, default=1)
    parser.add_argument("--aabb", type=int, default=2)
    parser.add_argument("--batch", type=int, default=-1)
    parser.add_argument("--cone", type=float, default=-1)
    return parser.parse_args()

def run_npg(args, frame):
    # load transform_*.json file
    f = open(args.scene_train_json)
    params = json.load(f)
    f.close()
    parent = os.path.split(args.scene_train_json)[0]
    psnr = 0.
    while psnr < 20.0:
        # python binding
        testbed = ngp.Testbed()
        if frame>0 and psnr>=20.0:
            try:
                print("load weight from previous time-step")
                save_path = os.path.join(parent, 'I-NGP', 'train', f'{frame-1:08d}')
                testbed.load_snapshot_finetune(os.path.join(save_path, 'per-frame.ingp'))
            except:
                # initialize a network
                testbed.reload_network_from_file(args.network)
        else:
            # initialize a network
            testbed.reload_network_from_file(args.network)       
        # setup root dir
        testbed.root_dir = parent
        # initialize a dataset
        testbed.create_empty_nerf_dataset(n_images=len(params['frames']), aabb_scale=args.aabb) #params['aabb_scale'])
        imgs = []
        # setup dataset
        for idx, param in enumerate(params['frames']):
            # TODO: Change undist to frames_1 in json file
            img_path = os.path.join(parent, 'frames_1', *param['file_path'].split(os.sep)[1:-1], f'{frame:08d}.png')
            print(img_path, idx)
            img = cv2.cvtColor(cv2.imread(img_path, cv2.IMREAD_UNCHANGED), cv2.COLOR_BGRA2RGBA)
            img = img.astype(np.float32)
            img /= 255.0
            # set_image should only accept linear color
            img = srgb_to_linear(img)
            imgs.append(img)
            # premultiply
            img[..., :3] *= img[..., 3:4]
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

        if args.gui:
            sw = width 
            sh = height 
            testbed.init_window(sw, sh)
            testbed.nerf.visualize_cameras = True


        # Enable following setting to follow NeRF paper setting 
        #testbed.color_space = ngp.ColorSpace.SRGB
        if args.cone>=0:
            testbed.nerf.cone_angle_constant = args.cone
        #testbed.nerf.training.random_bg_color = False
        
        if args.no_opt:
            print(f"Optimizing Camera Parameters !!")
            print("--------------------------------------------")
            testbed.nerf.training.optimize_extrinsics = True
            testbed.nerf.training.optimize_distortion = True

        save_path = os.path.join(parent, 'I-NGP', 'train', f'{frame:08d}')
        if not os.path.isdir(save_path):
            os.makedirs(save_path) 

        # Training
        testbed.nerf.training.n_images_for_training = len(params['frames'])
        total_n_steps = args.n_steps
        testbed.shall_train = True
        training_step = 0
        tqdm_last_update = 0
        min_loss = 1e10
        # near plane
        if args.near_distance>=0.0:
            testbed.nerf.training.near_distance = args.near_distance
        if args.batch>0:
            testbed.training_batch_size = args.batch
        # Start training
        if total_n_steps > 0:
            with tqdm(desc="Training", total=total_n_steps, unit="step") as t:
                while testbed.frame():
                    # What will happen when training is done?
                    if testbed.training_step >= total_n_steps:
                        break

                    # Update progress bar
                    now = time.monotonic()
                    if now - tqdm_last_update > 0.1:
                        t.update(testbed.training_step - training_step)
                        t.set_postfix(loss=testbed.loss)
                        training_step = testbed.training_step
                        tqdm_last_update = now  
                    if testbed.training_step>=total_n_steps-1500 and testbed.training_step%500==0 and  min_loss>testbed.loss:
                        min_loss = testbed.loss 
                        testbed.save_snapshot(os.path.join(save_path, "per-frame.ingp"), False)
 

        # Testing on the first training view
        testbed.nerf.training.n_images_for_training = len(params['frames'])
        testbed.shall_train = False
        # near plane
        if args.near_distance>=0.0:
            testbed.nerf.training.near_distance = args.near_distance
        testbed.background_color = [0.0, 0.0, 0.0, 1.0]
        testbed.snap_to_pixel_centers = True
        spp = 8
        save_root_path = os.path.join(parent, 'I-NGP', 'test')
        testbed.nerf.render_with_lens_distortion = False

        # Start testing
        with tqdm(range(testbed.nerf.training.dataset.n_images), unit="images", desc=f"Rendering test frame") as t:
            for i in t:
                print(i)
                resolution = testbed.nerf.training.dataset.metadata[i].resolution
                testbed.set_camera_to_training_view(i)
                testbed.render_ground_truth = False
                image = testbed.render(resolution[0], resolution[1], spp, True)

                # we should compute psnr in srgb space
                A = linear_to_srgb(image[..., :3])
                R = linear_to_srgb(imgs[i][..., :3])
                mse = float(compute_error("MSE", A, R))
                psnr = mse2psnr(mse)
                break
        print("PSNR:", psnr)
        

if __name__ == "__main__":
    start_time = time.time()
    args = parse_args()
    start = args.start_frame
    end = args.start_frame + args.num_frames
    for i in range(start, end, 1):
        run_npg(args, i)
    print("--- %s seconds ---" % (time.time() - start_time))
