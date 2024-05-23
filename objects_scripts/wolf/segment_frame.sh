mkdir ./assets/objects/wolf/calib
cp ./assets/calib_short/transforms_optim.json ./assets/objects/wolf/calib/
python3 src/segment_frame.py \
    --root_dir "./assets" \
    --network ../models/instant-ngp/configs/nerf/base.json \
    --name "wolf" \
    --snapshot 0 \
    --n_steps 15000 \
    --aabb_scale 4 \
    --mask_thresh 0.85 \
    --save_segmented_images \
    --ccp_thresh 5000 \
    --num_sep_obj 1 \
    --x_scale -0.200 0.916 \
    --y_scale 0.182 1.144 \
    --z_scale -0.037 0.975 \
    --start 0 \
    --end 3900 \
    --step 1 \
    --median_filter \
    --near_dis 0.5 \
    --per_img_lat \
    --per_img_lat_stop 10000 \    --transforms_json_path ./assets/objects/wolf/calib/transforms_optim.json \
