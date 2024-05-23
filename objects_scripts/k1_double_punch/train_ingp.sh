
OBJ=k1_double_punch

python3 src/train_frames.py \
        --scene_train_json assets/objects/$OBJ/dynamic_data/transforms_train.json \
        --start_frame 0 \
        --num_frames 630 \
        --n_steps 5000 \
        --network ../models/instant-ngp/configs/nerf/base.json \
