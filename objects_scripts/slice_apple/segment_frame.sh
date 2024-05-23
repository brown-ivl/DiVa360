mkdir ./assets/objects/slice_apple/calib
cp ./assets/calib_short/transforms_optim.json ./assets/objects/slice_apple/calib/
#!/bin/bash
# ## To run segmentation
python3 src/segment_frame.py \
    --root_dir "./assets" \
    --network ../models/instant-ngp/configs/nerf/base.json \
    --name "slice_apple" \
    --n_steps 30000 \
    --aabb_scale 4 \
    --mask_thresh 0.85 \
    --save_segmented_images \
    --ccp_thresh 15000 \
    --num_sep_obj 1 \
    --x_scale -0.35 1.4 \
    --y_scale 0.1 1.3 \
    --z_scale -0.35 1.4 \
    --start 0 \
    --end 500 \
    --step 1 \
    --near_dis 0.6 \
    --per_img_lat \
    --per_img_lat_stop 25000 \
    --transforms_json_path ./assets/objects/slice_apple/calib/transforms_optim.json \
