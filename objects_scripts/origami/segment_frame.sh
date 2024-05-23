mkdir ./assets/objects/origami/calib
cp ./assets/calib_long/transforms_optim.json ./assets/objects/origami/calib/
#!/bin/bash
# ## To run segmentation
python3 src/segment_frame.py \
    --root_dir "./assets" \
    --network ../models/instant-ngp/configs/nerf/base.json \
    --name "origami" \
    --n_steps 13000 \
    --aabb_scale 4 \
    --mask_thresh 0.85 \
    --save_segmented_images \
    --ccp_thresh 150 \
    --num_sep_obj 1 \
    --x_scale -0.35 1.25 \
    --y_scale 0.1 0.95 \
    --z_scale -0.35 1.05 \
    --start 0 \
    --end 5700 \
    --step 1 \
    --near_dis 0.505 \
    --per_img_lat \
    --per_img_lat_stop 10000 \
    --ckpt_name seg_00.ingp \
    --transforms_json_path ./assets/objects/origami/calib/transforms_optim.json \
