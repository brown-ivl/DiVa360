OBJ=bunny
start=`date +%s`
python ../models/mixvoxels_brics/train.py --config ../models/mixvoxels_brics/configs/schedule25000/${OBJ}/${OBJ}_00.txt --ckpt assets/objects/${OBJ}/dynamic_data/mixvoxels/${OBJ}_00/${OBJ}_00.th --render_only 1 --render_test 1 --render_path 0
python ../models/mixvoxels_brics/train.py --config ../models/mixvoxels_brics/configs/schedule25000/${OBJ}/${OBJ}_01.txt --ckpt assets/objects/${OBJ}/dynamic_data/mixvoxels/${OBJ}_01/${OBJ}_01.th --render_only 1 --render_test 1 --render_path 0
python ../models/mixvoxels_brics/train.py --config ../models/mixvoxels_brics/configs/schedule25000/${OBJ}/${OBJ}_02.txt --ckpt assets/objects/${OBJ}/dynamic_data/mixvoxels/${OBJ}_02/${OBJ}_02.th --render_only 1 --render_test 1 --render_path 0
python ../models/mixvoxels_brics/train.py --config ../models/mixvoxels_brics/configs/schedule25000/${OBJ}/${OBJ}_03.txt --ckpt assets/objects/${OBJ}/dynamic_data/mixvoxels/${OBJ}_03/${OBJ}_03.th --render_only 1 --render_test 1 --render_path 0
python ../models/mixvoxels_brics/train.py --config ../models/mixvoxels_brics/configs/schedule25000/${OBJ}/${OBJ}_04.txt --ckpt assets/objects/${OBJ}/dynamic_data/mixvoxels/${OBJ}_04/${OBJ}_04.th --render_only 1 --render_test 1 --render_path 0
python ../models/mixvoxels_brics/train.py --config ../models/mixvoxels_brics/configs/schedule25000/${OBJ}/${OBJ}_05.txt --ckpt assets/objects/${OBJ}/dynamic_data/mixvoxels/${OBJ}_05/${OBJ}_05.th --render_only 1 --render_test 1 --render_path 0
python ../models/mixvoxels_brics/train.py --config ../models/mixvoxels_brics/configs/schedule25000/${OBJ}/${OBJ}_06.txt --ckpt assets/objects/${OBJ}/dynamic_data/mixvoxels/${OBJ}_06/${OBJ}_06.th --render_only 1 --render_test 1 --render_path 0
python ../models/mixvoxels_brics/train.py --config ../models/mixvoxels_brics/configs/schedule25000/${OBJ}/${OBJ}_07.txt --ckpt assets/objects/${OBJ}/dynamic_data/mixvoxels/${OBJ}_07/${OBJ}_07.th --render_only 1 --render_test 1 --render_path 0
python ../models/mixvoxels_brics/train.py --config ../models/mixvoxels_brics/configs/schedule25000/${OBJ}/${OBJ}_08.txt --ckpt assets/objects/${OBJ}/dynamic_data/mixvoxels/${OBJ}_08/${OBJ}_08.th --render_only 1 --render_test 1 --render_path 0
python ../models/mixvoxels_brics/train.py --config ../models/mixvoxels_brics/configs/schedule25000/${OBJ}/${OBJ}_09.txt --ckpt assets/objects/${OBJ}/dynamic_data/mixvoxels/${OBJ}_09/${OBJ}_09.th --render_only 1 --render_test 1 --render_path 0
python ../models/mixvoxels_brics/train.py --config ../models/mixvoxels_brics/configs/schedule25000/${OBJ}/${OBJ}_10.txt --ckpt assets/objects/${OBJ}/dynamic_data/mixvoxels/${OBJ}_10/${OBJ}_10.th --render_only 1 --render_test 1 --render_path 0
python ../models/mixvoxels_brics/train.py --config ../models/mixvoxels_brics/configs/schedule25000/${OBJ}/${OBJ}_11.txt --ckpt assets/objects/${OBJ}/dynamic_data/mixvoxels/${OBJ}_11/${OBJ}_11.th --render_only 1 --render_test 1 --render_path 0
end=`date +%s`
python ./utils/move_mixvoxels_test.py --root ./assets/objects/ --target ./assets/objects/${OBJ}/dynamic_data/mixvoxels/imgs_test_all --num 12 --name ${OBJ}
python ./utils/benchmark.py --root ./assets/objects/${OBJ}/ --num_frames 1689 --target_path mixvoxels/imgs_test_all
runtime=$((end-start))
echo $runtime