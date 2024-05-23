mkdir ./assets/objects/unlock/calib
cp ./assets/calib_short/transforms_optim.json ./assets/objects/unlock/calib/
#!/bin/bash
# ## To run segmentation
python3 src/segment_frame.py \
    --root_dir "./assets" \
    --network ../models/instant-ngp/configs/nerf/base.json \
    --name "unlock" \
    --n_steps 20000 \
    --aabb_scale 4 \
    --mask_thresh 0.8 \
    --save_segmented_images \
    --ccp_thresh 50 \
    --num_sep_obj 1 \
    --x_scale -0.35 1.4 \
    --y_scale 0.1 1.3 \
    --z_scale -0.35 1.4 \
    --start 0 \
    --end 330 \
    --step 1 \
    --near_dis 0.6 \
    --per_img_lat \
    --per_img_lat_stop 15000 \
    --transforms_json_path ./assets/objects/unlock/calib/transforms_optim.json \
