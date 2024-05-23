mkdir ./assets/objects/flip_book/calib
cp ./assets/calib_short/transforms_optim.json ./assets/objects/flip_book/calib/
#!/bin/bash
# ## To run segmentation
python3 src/segment_frame.py \
    --root_dir "./assets" \
    --network ../models/instant-ngp/configs/nerf/base.json \
    --name "flip_book" \
    --n_steps 20000 \
    --aabb_scale 4 \
    --mask_thresh 0.8 \
    --save_segmented_images \
    --ccp_thresh 5000 \
    --num_sep_obj 1 \
    --x_scale 0.078 1.2 \
    --y_scale 0.1 0.82 \
    --z_scale -0.35 1.4 \
    --start 0 \
    --end 500 \
    --step 1 \
    --median_filter \
    --near_dis 0.4 \
    --per_img_lat \
    --per_img_lat_stop 15000 \
    --transforms_json_path ./assets/objects/flip_book/calib/transforms_optim.json \
