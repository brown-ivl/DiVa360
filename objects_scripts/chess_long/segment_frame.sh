mkdir ./assets/objects/chess_long/calib
cp ./assets/calib_long/transforms_optim.json ./assets/objects/chess_long/calib/
#!/bin/bash
# ## To run segmentation
python3 src/segment_frame.py \
    --root_dir "./assets" \
    --network ../models/instant-ngp/configs/nerf/base.json \
    --name "chess_long" \
    --n_steps 12000 \
    --aabb_scale 4 \
    --mask_thresh 0.8 \
    --save_segmented_images \
    --ccp_thresh 50 \
    --num_sep_obj 1 \
    --x_scale -0.23 1.19 \
    --y_scale 0.1 1.3 \
    --z_scale -0.54 1.15 \
    --start 0 \
    --end 3800 \
    --step 1 \
    --near_dis 0.47 \
    --per_img_lat \
    --per_img_lat_stop 8000 \
    --ckpt_name seg_00.ingp \
    --transforms_json_path ./assets/objects/chess_long/calib/transforms_optim.json \
