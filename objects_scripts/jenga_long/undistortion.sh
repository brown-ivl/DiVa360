#!/bin/bash

OBJ=jenga_long


## undistortion, crop images, generate transform.json
python3 utils/undistort_per_cam.py \
--root assets/objects/$OBJ/ \
--start 0 \
--num_frames 500 \
## undistortion, crop images, generate transform.json
python3 utils/undistort_per_cam.py \
--root assets/objects/$OBJ/ \
--start 500 \
--num_frames 500 \
## undistortion, crop images, generate transform.json
python3 utils/undistort_per_cam.py \
--root assets/objects/$OBJ/ \
--start 1000 \
--num_frames 500 \
## undistortion, crop images, generate transform.json
python3 utils/undistort_per_cam.py \
--root assets/objects/$OBJ/ \
--start 1500 \
--num_frames 500 \
## undistortion, crop images, generate transform.json
python3 utils/undistort_per_cam.py \
--root assets/objects/$OBJ/ \
--start 2000 \
--num_frames 500 \
## undistortion, crop images, generate transform.json
python3 utils/undistort_per_cam.py \
--root assets/objects/$OBJ/ \
--start 2500 \
--num_frames 500 \
## undistortion, crop images, generate transform.json
python3 utils/undistort_per_cam.py \
--root assets/objects/$OBJ/ \
--start 3000 \
--num_frames 500 \
## undistortion, crop images, generate transform.json
python3 utils/undistort_per_cam.py \
--root assets/objects/$OBJ/ \
--start 3500 \
--num_frames 500 \
## undistortion, crop images, generate transform.json
python3 utils/undistort_per_cam.py \
--root assets/objects/$OBJ/ \
--start 4000 \
--num_frames 500 \
## undistortion, crop images, generate transform.json
python3 utils/undistort_per_cam.py \
--root assets/objects/$OBJ/ \
--start 4500 \
--num_frames 500 \
## undistortion, crop images, generate transform.json
python3 utils/undistort_per_cam.py \
--root assets/objects/$OBJ/ \
--start 5000 \
--num_frames 500 \
## undistortion, crop images, generate transform.json
python3 utils/undistort_per_cam.py \
--root assets/objects/$OBJ/ \
--start 5500 \
--num_frames 500 \


## add transforms.json to object folder
cp -r assets/objects/$OBJ/calib/transforms.json assets/objects/$OBJ

## setup dynamic dataset
mkdir assets/objects/$OBJ/dynamic_data
rm -rf assets/objects/$OBJ/dynamic_data/frames_1
mkdir assets/objects/$OBJ/dynamic_data/frames_1
mv -f assets/objects/$OBJ/undist/* assets/objects/$OBJ/dynamic_data/frames_1/
python3 utils/splitJson.py \
    --src assets/objects/$OBJ
