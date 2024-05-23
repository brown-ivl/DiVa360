mkdir ./assets/objects/wall_e/calib
cp ./assets/calib_short/transforms_optim.json ./assets/objects/wall_e/calib/
#!/bin/bash
# ## To run segmentation
python3 src/segment_frame.py \
    --root_dir "./assets" \
    --network ../models/instant-ngp/configs/nerf/base.json \
    --name "wall_e" \
    --n_steps 30000 \
    --aabb_scale 4 \
    --mask_thresh 0.9 \
    --save_segmented_images \
    --ccp_thresh 30000 \
    --num_sep_obj 1 \
    --x_scale -0.32 0.71 \
    --y_scale 0.1 0.825 \
    --z_scale 0.285 1.092 \
    --start 0 \
    --end 750 \
    --step 1 \
    --median_filter \
    --near_dis 0.5 \
    --per_img_lat \
    --per_img_lat_stop 25000 \
    --transforms_json_path ./assets/objects/wall_e/calib/transforms_optim.json \
