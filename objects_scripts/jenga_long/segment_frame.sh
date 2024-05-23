mkdir ./assets/objects/jenga_long/calib
cp ./assets/calib_long/transforms_optim.json ./assets/objects/jenga_long/calib/
#!/bin/bash
# ## To run segmentation
python3 src/segment_frame.py \
    --root_dir "./assets" \
    --network ../models/instant-ngp/configs/nerf/base.json \
    --name "jenga_long" \
    --n_steps 10000 \
    --aabb_scale 4 \
    --mask_thresh 0.85 \
    --save_segmented_images \
    --ccp_thresh 100 \
    --num_sep_obj 1 \
    --x_scale -0.25 0.8 \
    --y_scale 0.1 1.3 \
    --z_scale -0.35 1.0 \
    --start 0 \
    --end 6000 \
    --step 1 \
    --near_dis 0.55 \
    --per_img_lat \
    --per_img_lat_stop 7000 \
    --ckpt_name seg_00.ingp \
    --transforms_json_path ./assets/objects/jenga_long/calib/transforms_optim.json \
