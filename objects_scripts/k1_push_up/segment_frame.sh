mkdir ./assets/objects/k1_push_up/calib
cp ./assets/calib_short/transforms_optim.json ./assets/objects/k1_push_up/calib/
#!/bin/bash
# ## To run segmentation
python3 src/segment_frame.py \
    --root_dir "./assets" \
    --network ../models/instant-ngp/configs/nerf/base.json \
    --name "k1_push_up" \
    --n_steps 10000 \
    --aabb_scale 4 \
    --mask_thresh 0.9 \
    --save_segmented_images \
    --ccp_thresh 20000 \
    --num_sep_obj 1 \
    --x_scale 0.159 1.0 \
    --y_scale 0.1 1.2 \
    --z_scale 0.125 0.815 \
    --start 0 \
    --end 630 \
    --step 1 \
    --median_filter \
    --near_dis 0.44 \
    --per_img_lat \
    --per_img_lat_stop 7000 \
    --transforms_json_path ./assets/objects/k1_push_up/calib/transforms_optim.json \
