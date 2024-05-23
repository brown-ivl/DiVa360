mkdir ./assets/objects/rubiks_cube/calib
cp ./assets/calib_long/transforms_optim.json ./assets/objects/rubiks_cube/calib/
#!/bin/bash
# ## To run segmentation
python3 src/segment_frame.py \
    --root_dir "./assets" \
    --network ../models/instant-ngp/configs/nerf/base.json \
    --name "rubiks_cube" \
    --n_steps 12000 \
    --aabb_scale 4 \
    --mask_thresh 0.85 \
    --save_segmented_images \
    --ccp_thresh 100 \
    --num_sep_obj 1 \
    --x_scale -0.01 1.032 \
    --y_scale 0.1 1.3 \
    --z_scale -0.2 0.9 \
    --start 0 \
    --end 5400 \
    --step 1 \
    --near_dis 0.55 \
    --per_img_lat \
    --per_img_lat_stop 7000 \
    --ckpt_name seg_00.ingp \
    --transforms_json_path ./assets/objects/rubiks_cube/calib/transforms_optim.json \
