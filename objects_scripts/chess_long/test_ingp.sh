  
OBJ=chess_long
FRAMES=3800

#python3 src/infer_frames.py \
#        --scene_test_json assets/objects/$OBJ/dynamic_data/transforms_test.json \
#        --start_frame 0 \
#        --num_frames $FRAMES \

python3 ../../dynamic_1/brics-tools/utils/benchmark.py \
        --root assets/objects/$OBJ/ \
        --start 0 \
        --num_frames $FRAMES \
        --target_path I-NGP/test \
