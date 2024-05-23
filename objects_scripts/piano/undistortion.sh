#!/bin/bash

OBJ=piano


## undistortion, crop images, generate transform.json
python3 utils/undistort_per_cam.py \
--root assets/objects/$OBJ/ \
--num_frames 711 \

## add transforms.json to object folder
cp -r assets/objects/$OBJ/calib/transforms.json assets/objects/$OBJ

## setup dynamic dataset
mkdir assets/objects/$OBJ/dynamic_data
rm -rf assets/objects/$OBJ/dynamic_data/frames_1
mkdir assets/objects/$OBJ/dynamic_data/frames_1
mv -f assets/objects/$OBJ/undist/* assets/objects/$OBJ/dynamic_data/frames_1/
python3 utils/splitJson.py \
    --src assets/objects/$OBJ
