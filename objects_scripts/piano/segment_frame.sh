mkdir ./assets/objects/piano/calib
cp ./assets/calib_short/transforms_optim.json ./assets/objects/piano/calib/
#!/bin/bash
# ## To run segmentation
python3 src/segment_frame.py \
    --root_dir "./assets" \
    --network ../models/instant-ngp/configs/nerf/base.json \
    --name "piano" \
    --n_steps 15000 \
    --aabb_scale 4 \
    --mask_thresh 0.85 \
    --save_segmented_images \
    --ccp_thresh 20000 \
    --num_sep_obj 1 \
    --x_scale -0.35 1.4 \
    --y_scale 0.1 1.3 \
    --z_scale -0.35 1.4 \
    --start 0 \
    --end 720 \
    --step 1 \
    --median_filter \
    --near_dis 0.55 \
    --per_img_lat \
    --per_img_lat_stop 10000 \
    --transforms_json_path ./assets/objects/piano/calib/transforms_optim.json \
