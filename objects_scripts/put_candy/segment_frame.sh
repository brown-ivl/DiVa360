mkdir ./assets/objects/put_candy/calib
cp ./assets/calib_short/transforms_optim.json ./assets/objects/put_candy/calib/
#!/bin/bash
# ## To run segmentation
python3 src/segment_frame.py \
    --root_dir "./assets" \
    --network ../models/instant-ngp/configs/nerf/base.json \
    --name "put_candy" \
    --n_steps 15000 \
    --aabb_scale 4 \
    --mask_thresh 0.85 \
    --save_segmented_images \
    --ccp_thresh 500 \
    --num_sep_obj 1 \
    --x_scale -0.35 1.4 \
    --y_scale 0.1 1.3 \
    --z_scale -0.35 1.4 \
    --start 0 \
    --end 500 \
    --step 1 \
    --median_filter \
    --near_dis 0.6 \
    --per_img_lat \
    --per_img_lat_stop 10000 \
    --transforms_json_path ./assets/objects/put_candy/calib/transforms_optim.json \
