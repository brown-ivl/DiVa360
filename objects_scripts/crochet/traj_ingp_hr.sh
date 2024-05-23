OBJ=crochet
FRAMES=5400
python3 utils/trajectory_spiral_hr.py \
                 --src assets/objects/$OBJ/transforms.json \
                 --dst assets/objects/$OBJ/dynamic_data/transforms_spiral_hr.json \
                 --num_frames  $FRAMES\
                 --min_r 0.65 \
                 --max_r 1.4 \
                 --center 0.5 0.5 0.5 \

python3 src/traj_frames.py \
                 --scene_test_json assets/objects/$OBJ/dynamic_data/transforms_spiral_hr.json \
                 --num_frames $FRAMES \
                 --suffix "_spiral_hr" \
 