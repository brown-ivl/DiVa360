import os
import sys
sys.path.append("../models/instant-ngp/build")
sys.path.append("../models/instant-ngp/scripts")
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
from common import srgb_to_linear, linear_to_srgb


def get_parser():
    parser = ArgumentParser()
    parser.add_argument("--root_dir", type=str, required=True)
    parser.add_argument("--network", type=str, required=True)
    parser.add_argument("--x_scale", nargs=2, default=[-0.2, 1.2], type=float)
    parser.add_argument("--y_scale", nargs=2, default=[0.12, 0.85], type=float)
    parser.add_argument("--z_scale", nargs=2, default=[-0.2, 1.35], type=float)
    parser.add_argument("--name", type=str, required=True)
    parser.add_argument("--separate_calib", action="store_true")
    parser.add_argument("--gui", action="store_true")
    parser.add_argument("--face_to_cam", action="store_true")
    parser.add_argument("--no_random_color", action="store_true")
    parser.add_argument("--per_img_lat", action="store_true")
    parser.add_argument("--per_img_lat_stop", type=int, default=3000)
    parser.add_argument("--aabb_scale", type=int, default=16)
    parser.add_argument("--start", type=int, default=0)
    parser.add_argument("--end", type=int, default=-1)
    parser.add_argument("--step", type=int, default=1)
    parser.add_argument("--near_dis", type=float, default=0.4)
    parser.add_argument("--static", action="store_true")
    parser.add_argument("--median_filter", action="store_true")
    parser.add_argument("--save_segmented_images", action="store_true")
    parser.add_argument("--transforms_json_path", type=str, default="./assets/calib/transforms_optim.json")
    parser.add_argument("--n_steps", default=10000, type=int)
    parser.add_argument("--mask_thresh", default=0.8, type=float)
    parser.add_argument("--ccp_thresh", default=10000, type=int)
    parser.add_argument("--num_sep_obj", default=1, type=int)
    parser.add_argument("--ckpt_name", type=str, default="seg.ingp")

    args = parser.parse_args()
    return args

def segment_frame(params, frame_num, base_path, args, output_path, ckpt_name="seg.ingp"):

    testbed = ngp.Testbed()
    try:
        testbed.load_snapshot_finetune(os.path.join(base_path, ckpt_name))
    except:
        testbed.reload_network_from_file(args.network)

    testbed.create_empty_nerf_dataset(n_images=len(params), aabb_scale=args.aabb_scale)

    # Upload images to I-NGP
    imgs = []
    image_dir = os.path.join(base_path, "image")
    for idx, param in enumerate(params):
        cam_name = param['file_path'].split(os.sep)[0]
        img_list = natsorted(glob(f"{image_dir}/{cam_name}/*.[jp][pn]g"))
        img = cv2.cvtColor(cv2.imread(img_list[frame_num], cv2.IMREAD_UNCHANGED), cv2.COLOR_BGRA2RGBA)       
        img = img.astype(np.float32)
        img /= 255.
        imgs.append(np.copy(img))
        # set image should only accept linear color as input
        img = srgb_to_linear(img)
        depth_img = np.zeros((img.shape[0], img.shape[1]))
        height, width = img.shape[:2]
        os.makedirs(os.path.join(output_path, cam_name), exist_ok=True)
        c2w = param['transform_matrix']

        testbed.nerf.training.set_image(idx, img, depth_img)
        testbed.nerf.training.set_camera_extrinsics(idx, c2w[:3], convert_to_ngp=True)
        testbed.nerf.training.set_camera_intrinsics(
            idx,
            fx=param["fl_x"], fy=param["fl_y"],
            cx=param["cx"], cy=param["cy"],
            k1=param["k1"], k2=param["k2"],
            p1=param["p1"], p2=param["p2"]
        )
        idx +=1
    # Taken from i-ngp:scripts/run.py
    #testbed.color_space = ngp.ColorSpace.SRGB
    testbed.nerf.cone_angle_constant = 0.004
    testbed.nerf.visualize_cameras = True
    testbed.nerf.training.random_bg_color = args.no_random_color==False
    # Set alpha to 0 to get accumulation value
    testbed.background_color = [0.0, 0.0, 0.0, 0.0]

    testbed.nerf.training.n_images_for_training = len(params)

    # Segment
    total_n_steps = args.n_steps

    print(f"Optimizing Camera Parameters !!")
    print("--------------------------------------------")
    testbed.nerf.training.optimize_extrinsics = True
    #testbed.nerf.training.optimize_focal_length = True
    testbed.nerf.training.optimize_distortion = True
    testbed.nerf.training.optimize_extra_dims = args.per_img_lat

    testbed.nerf.training.near_distance = args.near_dis
    #testbed.training_batch_size = 262144
    testbed.shall_train = True
    tqdm_last_update = 0
    counter = 0   
    old_training_step = 0
    min_loss = 1e10
    with tqdm(desc="Training", total=total_n_steps, unit="step") as t:
        while testbed.frame():
            # What will happen when training is done?
            if counter >= total_n_steps:
                break
            if testbed.training_step == args.per_img_lat_stop:
                testbed.nerf.training.optimize_extra_dims = False        
            # Update progress bar
            now = time.monotonic()
            if now - tqdm_last_update > 0.1:
                t.update(counter-old_training_step)
                t.set_postfix(loss=testbed.loss)
                old_training_step = counter
                tqdm_last_update = now
            counter += 1
            #print(counter, testbed.training_step)
            if counter>=2*total_n_steps/3 and counter%1000==0 and min_loss>testbed.loss:
                min_loss = testbed.loss
                testbed.save_snapshot(os.path.join(base_path, ckpt_name), False)

    #if args.gui:
    #    testbed.init_window(1920, 1080)
    #    while testbed.frame():
    #        if testbed.want_repl():
    #            ipdb.set_trace()       
              
    testbed.load_snapshot(os.path.join(base_path, ckpt_name))
                 
        
            
    testbed.shall_train = False
    testbed.render_aabb.min = np.array([args.x_scale[0], args.y_scale[0], args.z_scale[0]])
    testbed.render_aabb.max = np.array([args.x_scale[1], args.y_scale[1], args.z_scale[1]])

    masks = []
    testbed.render_mode = ngp.RenderMode.AO
    testbed.nerf.render_with_lens_distortion = False
    for idx in tqdm(range(len(params))):
        testbed.set_camera_to_training_view(idx)
        frame = testbed.render(width, height, 1, True)
        mask = frame[:, :, 3]
        if args.median_filter:
            mask = (cv2.medianBlur((frame[:,:,3]*255).astype(np.uint8), 11)/255.)>args.mask_thresh
        else:
            mask = frame[:,:,3]>args.mask_thresh
        mask = (mask*255).astype(np.uint8)
        num_labels, labels = cv2.connectedComponents(mask)
        if num_labels>args.num_sep_obj:
            for i in range(1, num_labels+1):
                temp = np.sum((labels == i).astype(np.uint8))
                if temp < args.ccp_thresh:
                    mask[labels == i] = 0
        img = imgs[idx]
        img[mask<255] = 0.
        if args.save_segmented_images:
            img = cv2.cvtColor(img, cv2.COLOR_RGBA2BGRA)
            cam_name = params[idx]['file_path'].split(os.sep)[0]
            cv2.imwrite(os.path.join(output_path, cam_name, f"{frame_num:08d}.png"), 255*img)

    if args.gui:
        testbed.init_window(1920, 1080)
        while testbed.frame():
            if testbed.want_repl():
                ipdb.set_trace()

def main():
    args = get_parser()
    
    f = open(args.transforms_json_path)
    params = json.load(f)

    params = params['frames']
    
    if args.static:
        frame_nums = [ 0 ]
    else:
        frame_nums = range(args.start, args.end, args.step)

    base_path = os.path.join(args.root_dir, "objects", args.name)
    # Create output directory
    output_path = os.path.join(base_path, "segmented_ngp")
    os.makedirs(output_path, exist_ok=True)
    for frame_num in tqdm(frame_nums):
        print(args.name, frame_num)
        segment_frame(params, frame_num, base_path, args, output_path, args.ckpt_name)

if __name__ == '__main__':
    main()
