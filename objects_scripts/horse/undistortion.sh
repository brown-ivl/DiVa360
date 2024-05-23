#!/bin/bash

OBJ=horse


## undistortion, crop images, generate transform.json
python3 utils/undistort_per_cam.py \
--root assets/objects/$OBJ/ \
--start 0 \
--num_frames 700 \
## undistortion, crop images, generate transform.json
python3 utils/undistort_per_cam.py \
--root assets/objects/$OBJ/ \
--start 700 \
--num_frames 700 \
## undistortion, crop images, generate transform.json
python3 utils/undistort_per_cam.py \
--root assets/objects/$OBJ/ \
--start 1400 \
--num_frames 700 \
## undistortion, crop images, generate transform.json
python3 utils/undistort_per_cam.py \
--root assets/objects/$OBJ/ \
--start 2100 \
--num_frames 700 \
## undistortion, crop images, generate transform.json
python3 utils/undistort_per_cam.py \
--root assets/objects/$OBJ/ \
--start 2800 \
--num_frames 700 \
## undistortion, crop images, generate transform.json
python3 utils/undistort_per_cam.py \
--root assets/objects/$OBJ/ \
--start 3500 \
--num_frames 700 \
## undistortion, crop images, generate transform.json
python3 utils/undistort_per_cam.py \
--root assets/objects/$OBJ/ \
--start 4200 \
--num_frames 700 \
## undistortion, crop images, generate transform.json
python3 utils/undistort_per_cam.py \
--root assets/objects/$OBJ/ \
--start 4900 \
--num_frames 700 \
## undistortion, crop images, generate transform.json
python3 utils/undistort_per_cam.py \
--root assets/objects/$OBJ/ \
--start 5600 \
--num_frames 67 \

## add transforms.json to object folder
cp -r assets/objects/$OBJ/calib/transforms.json assets/objects/$OBJ

## setup dynamic dataset
mkdir assets/objects/$OBJ/dynamic_data
rm -rf assets/objects/$OBJ/dynamic_data/frames_1
mkdir assets/objects/$OBJ/dynamic_data/frames_1
mv -f assets/objects/$OBJ/undist/* assets/objects/$OBJ/dynamic_data/frames_1/
python3 utils/splitJson.py \
    --src assets/objects/$OBJ
