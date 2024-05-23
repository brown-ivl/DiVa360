
OBJ=unlock

python3 src/train_frames.py \
        --scene_train_json assets/objects/$OBJ/dynamic_data/transforms_train.json \
        --start_frame 0 \
        --num_frames 330 \
        --n_steps 15000 \
        --cone 0.008 \
        --batch 32768 \
        --network ../models/instant-ngp/configs/nerf/base.json \
