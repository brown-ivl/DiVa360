module load ffmpeg/4.0.1 cuda/11.7.1 cudnn/8.2.0 gcc/7.2 glew/2.1.0
OBJ=wolf
start=`date +%s`
python models/mixvoxels_2/train.py --config models/mixvoxels_2/configs/schedule25000/${OBJ}/${OBJ}_20.txt --ckpt assets/objects/${OBJ}/dynamic_data/mixvoxels/${OBJ}_20/${OBJ}_20.th --render_only 1 --render_test 1 --render_path 0
python models/mixvoxels_2/train.py --config models/mixvoxels_2/configs/schedule25000/${OBJ}/${OBJ}_21.txt --ckpt assets/objects/${OBJ}/dynamic_data/mixvoxels/${OBJ}_21/${OBJ}_21.th --render_only 1 --render_test 1 --render_path 0
python models/mixvoxels_2/train.py --config models/mixvoxels_2/configs/schedule25000/${OBJ}/${OBJ}_22.txt --ckpt assets/objects/${OBJ}/dynamic_data/mixvoxels/${OBJ}_22/${OBJ}_22.th --render_only 1 --render_test 1 --render_path 0
python models/mixvoxels_2/train.py --config models/mixvoxels_2/configs/schedule25000/${OBJ}/${OBJ}_23.txt --ckpt assets/objects/${OBJ}/dynamic_data/mixvoxels/${OBJ}_23/${OBJ}_23.th --render_only 1 --render_test 1 --render_path 0
python models/mixvoxels_2/train.py --config models/mixvoxels_2/configs/schedule25000/${OBJ}/${OBJ}_24.txt --ckpt assets/objects/${OBJ}/dynamic_data/mixvoxels/${OBJ}_24/${OBJ}_24.th --render_only 1 --render_test 1 --render_path 0
python ./utils/move_mixvoxels_white.py --root ./assets/objects/ --target ./assets/objects/${OBJ}/dynamic_data/mixvoxels/imgs_test_all_white --num 25 --name ${OBJ}
end=`date +%s`
runtime=$((end-start))
echo $runtime