import os
import sys
import subprocess
from glob import glob
from argparse import ArgumentParser

def parse_args():
    parser = ArgumentParser()
    parser.add_argument("--root", required=True, help="Object folder")
    parser.add_argument("--name", required=True, help="Object name")
    args = parser.parse_args()
    return args
    
def move_test_files(root, name):
    cams = ["cam00", "cam16", "cam17", "cam33", "cam43", "cam44"]
    kplane_path = os.path.join(root, name, "dynamic_data", "kplanes")
    model_path = glob(os.path.join(kplane_path, f"{name}_*[!IST]"))
    target = os.path.join(root, name, "dynamic_data", "kplanes", "test")
    # make target folder
    os.makedirs(target, exist_ok=True)
    
    for cam in cams:       
        os.makedirs(os.path.join(target, cam), exist_ok=True)
    # start copy
    for model in model_path:
        test_path = os.path.join(model, "test_images")
        for cam in cams:
            srcs = glob(os.path.join(test_path, cam, "*.png"))
            dsts = os.path.join(target, cam)
            for src in srcs:
                i = int(src.split("_")[-1][:-4])
                dst = os.path.join(dsts, f"{i:08d}.png")
                subprocess.run(f"cp -r {src} {dst}", shell=True)

def main(args):
    move_test_files(args.root, args.name)
    
if __name__ == "__main__":
    args = parse_args()
    main(args)
    
    
