mkdir ./assets/objects/kindle/calib
cp ./assets/calib_short/transforms_optim.json ./assets/objects/kindle/calib/
python3 src/segment_frame.py \
    --root_dir "./assets" \
    --network ../models/instant-ngp/configs/nerf/base.json \
    --name "kindle" \
    --n_steps 20000 \
    --aabb_scale 4 \
    --mask_thresh 0.9 \
    --save_segmented_images \
    --ccp_thresh 5000 \
    --num_sep_obj 1 \
    --x_scale -0.35 1.4 \
    --y_scale 0.1 1.3 \
    --z_scale -0.35 1.4 \
    --start 0 \
    --end 600 \
    --step 1 \
    --median_filter \
    --near_dis 0.6 \
    --per_img_lat \
    --per_img_lat_stop 7000 \
    --transforms_json_path ./assets/objects/kindle/calib/transforms_optim.json \
