import os
import shutil
from glob import glob
from argparse import ArgumentParser

def moveFile(src, dst):

    if not os.path.isdir(dst):
        os.makedirs(dst)
        
    for i, s in enumerate(sorted(os.listdir(src))):
        path = os.path.join(src, s, "00000000.png")
        os.makedirs(os.path.join(dst, s), exist_ok=True)
        shutil.copy(path, os.path.join(dst, s, '00000000.png'))
        
if __name__ == "__main__":
    parser = ArgumentParser()
    parser.add_argument("--src", required=True, help="Source of BRICS dataset")
    parser.add_argument("--dst", required=True, help="Destination in assets")
    args = parser.parse_args()

    moveFile(args.src, args.dst)