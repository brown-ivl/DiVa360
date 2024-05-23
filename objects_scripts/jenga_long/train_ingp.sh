#!/bin/bash

OBJ=jenga_long

python3 src/train_frames.py \
        --scene_train_json assets/objects/$OBJ/dynamic_data/transforms_train.json \
        --start_frame 0 \
        --num_frames 6000 \
        --n_steps 5000 \
        --network ../models/instant-ngp/configs/nerf/base.json \
