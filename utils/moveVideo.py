import os
import shutil
from glob import glob
from argparse import ArgumentParser
import cv2
from PIL import Image
import math


def moveFile(src, dst, start_frame, num_frames):

    if not os.path.isdir(dst):
        os.makedirs(dst)
    
    # filter out mic folder
    paths = sorted([f for f in os.listdir(src) if "mic" not in f.split(os.sep)[-1]])
    first_path = paths[0]
    video_path = os.path.join(src, first_path, first_path + ".avi")
    if os.path.isfile(os.path.join(src, first_path, first_path + "_syncedaudio_files.txt")):
        text_path = os.path.join(src, first_path, first_path + "_syncedaudio_files.txt")
    else:
        text_path = os.path.join(src, first_path, first_path + "_synced_files.txt")
    
    frame_times = []
    frame_indices = []
    time_stamps = []
    with open(text_path) as text_file:
        for i, l in enumerate(text_file):
            line = l.split(" ")
            time = int(line[2])
            time_stamps.append(time)

    for i in range(start_frame, start_frame+num_frames):
        frame_times.append(time_stamps[0] + i*33333)
        
    frame_indices = []
    start_index = 0
    for i, t in enumerate(frame_times):
        diff = math.inf
        index = 0
        count = 0
        for j in range(start_index, len(time_stamps)):
            time_stamp = time_stamps[j]
            cur_diff = abs(t - time_stamp)
            if cur_diff <= diff:
                diff = cur_diff
                index = j
            else:
                break
            #     count += 1
            # if count == 2:
            #     break
        frame_indices.append(index)
    # print(frame_indices, len(frame_indices))
    
    for i, s in enumerate(sorted(paths)):
        video = os.path.join(src, s, s + ".avi")
        cap = cv2.VideoCapture(video)
        length = int(cap.get(cv2.CAP_PROP_FRAME_COUNT))
        total_frames = 0
        saved_frames = 0
        ret = True
        index = frame_indices[0]
        dst_cam = os.path.join(dst, f"cam{i:02d}")
        if not os.path.isdir(dst_cam):
                 os.makedirs(dst_cam)
        while ret:
            ret, img = cap.read()
            #print(total_frames, saved_frames, index, ret)
            if ret:
                while total_frames == index:
                    name = f"{saved_frames:08d}.jpg"
                    cv2.imwrite(os.path.join(dst_cam, name), img)
                    saved_frames+=1
                    if saved_frames >= len(frame_indices):
                        break
                    index = frame_indices[saved_frames]
                    if index == frame_indices[-1]:
                        break
                total_frames += 1
                
if __name__ == "__main__":
    parser = ArgumentParser()
    parser.add_argument("--src", required=True, help="Source of BRICS dataset")
    parser.add_argument("--dst", required=True, help="Destination in assets")
    parser.add_argument("--start_frame", type=int, default=0)
    parser.add_argument("--num_frames", required=True, type=int)
    args = parser.parse_args()
    
    moveFile(args.src, args.dst, args.start_frame, args.num_frames)
