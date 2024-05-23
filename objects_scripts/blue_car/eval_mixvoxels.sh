OBJ=blue_car
start=`date +%s`
python ../models/mixvoxels_brics/train.py --config ../models/mixvoxels_brics/configs/schedule25000/${OBJ}/${OBJ}_00.txt --ckpt assets/objects/${OBJ}/dynamic_data/mixvoxels/${OBJ}_00/${OBJ}_00.th --render_only 1 --render_test 1 --render_path 0
python ../models/mixvoxels_brics/train.py --config ../models/mixvoxels_brics/configs/schedule25000/${OBJ}/${OBJ}_01.txt --ckpt assets/objects/${OBJ}/dynamic_data/mixvoxels/${OBJ}_01/${OBJ}_01.th --render_only 1 --render_test 1 --render_path 0
end=`date +%s`
python ./utils/move_mixvoxels_test.py --root ./assets/objects/ --target ./assets/objects/${OBJ}/dynamic_data/mixvoxels/imgs_test_all --num 2 --name ${OBJ}
python ./utils/benchmark.py --root ./assets/objects/${OBJ}/ --num_frames 251 --target_path mixvoxels/imgs_test_all
runtime=$((end-start))
echo $runtime