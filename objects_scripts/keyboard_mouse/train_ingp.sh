
OBJ=keyboard_mouse

python3 src/train_frames.py \
        --scene_train_json assets/objects/$OBJ/dynamic_data/transforms_train.json \
        --start_frame 0 \
        --num_frames 360 \
        --n_steps 5000 \
        --network ../models/instant-ngp/configs/nerf/base.json \
