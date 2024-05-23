mkdir ./assets/objects/maracas/calib
cp ./assets/calib_short/transforms_optim.json ./assets/objects/maracas/calib/
#!/bin/bash
# ## To run segmentation
python3 src/segment_frame.py \
    --root_dir "./assets" \
    --network ../models/instant-ngp/configs/nerf/base.json \
    --name "maracas" \
    --n_steps 10000 \
    --aabb_scale 4 \
    --mask_thresh 0.85 \
    --save_segmented_images \
    --ccp_thresh 10000 \
    --num_sep_obj 1 \
    --x_scale 0.078 1.2 \
    --y_scale 0.1 1.096 \
    --z_scale -0.35 1.4 \
    --start 0 \
    --end 270 \
    --step 1 \
    --median_filter \
    --near_dis 0.45 \
    --per_img_lat \
    --per_img_lat_stop 7000 \
    --transforms_json_path ./assets/objects/maracas/calib/transforms_optim.json \
