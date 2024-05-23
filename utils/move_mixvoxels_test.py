import os
from argparse import ArgumentParser
import shutil

def move_test_files(root, target, num, name):
    src = os.path.join(root, name, 'dynamic_data', 'mixvoxels')
    for i in range(num):
        split_folder = os.path.join(src, f'{name}_{str(i).zfill(2)}', 'imgs_test_all', 'images')
        for img in os.listdir(split_folder):
            _, prefix, cam, img_type, time = img.split("_")
            time, _ = time.split(".")
            time = int(time)
            if prefix == "comp" and img_type=="rgb":
                if not os.path.exists(os.path.join(target, cam)):
                    os.mkdir(os.path.join(target, cam))
                shutil.copy(os.path.join(split_folder, img), os.path.join(target, cam, str(time+i*150).zfill(8) + '.png'))

if __name__ == "__main__":
    parser = ArgumentParser()
    parser.add_argument("--root", required=True, help="Object folder")
    parser.add_argument("--target", required=True, help="Target folder")
    parser.add_argument("--num", type=int, required=True, help="Number of splits")
    parser.add_argument("--name", required=True, help="Object name")
    args = parser.parse_args()
    if not os.path.exists(args.target):
        os.mkdir(args.target)
    move_test_files(args.root, args.target, args.num, args.name)

