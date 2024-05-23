  
OBJ=world_globe
FRAMES=1000

python3 src/infer_frames.py \
        --scene_test_json assets/objects/$OBJ/dynamic_data/transforms_test.json \
        --start_frame 0 \
        --num_frames $FRAMES \

python3 utils/benchmark.py \
        --root assets/objects/$OBJ/ \
        --start 0 \
        --num_frames $FRAMES \

