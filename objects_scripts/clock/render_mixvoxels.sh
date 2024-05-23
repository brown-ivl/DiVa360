OBJ=clock
start=`date +%s`
python ../models/mixvoxels_brics/render_circle.py --config ../models/mixvoxels_brics/configs/schedule25000/${OBJ}/${OBJ}_00.txt --ckpt assets/objects/${OBJ}/dynamic_data/mixvoxels/${OBJ}_00/${OBJ}_00.th --n_train_frames 1
cp ./assets/objects/${OBJ}/dynamic_data/mixvoxels/${OBJ}_00/imgs_spiral_hr_all/*.png ./assets/objects/${OBJ}/dynamic_data/mixvoxels/imgs_spiral_hr_all/
python ../models/mixvoxels_brics/render_circle.py --config ../models/mixvoxels_brics/configs/schedule25000/${OBJ}/${OBJ}_01.txt --ckpt assets/objects/${OBJ}/dynamic_data/mixvoxels/${OBJ}_01/${OBJ}_01.th --n_train_frames 1
cp ./assets/objects/${OBJ}/dynamic_data/mixvoxels/${OBJ}_01/imgs_spiral_hr_all/*.png ./assets/objects/${OBJ}/dynamic_data/mixvoxels/imgs_spiral_hr_all/
python ../models/mixvoxels_brics/render_circle.py --config ../models/mixvoxels_brics/configs/schedule25000/${OBJ}/${OBJ}_02.txt --ckpt assets/objects/${OBJ}/dynamic_data/mixvoxels/${OBJ}_02/${OBJ}_02.th --n_train_frames 1
cp ./assets/objects/${OBJ}/dynamic_data/mixvoxels/${OBJ}_02/imgs_spiral_hr_all/*.png ./assets/objects/${OBJ}/dynamic_data/mixvoxels/imgs_spiral_hr_all/
python ../models/mixvoxels_brics/render_circle.py --config ../models/mixvoxels_brics/configs/schedule25000/${OBJ}/${OBJ}_03.txt --ckpt assets/objects/${OBJ}/dynamic_data/mixvoxels/${OBJ}_03/${OBJ}_03.th --n_train_frames 1
cp ./assets/objects/${OBJ}/dynamic_data/mixvoxels/${OBJ}_03/imgs_spiral_hr_all/*.png ./assets/objects/${OBJ}/dynamic_data/mixvoxels/imgs_spiral_hr_all/
python ../models/mixvoxels_brics/render_circle.py --config ../models/mixvoxels_brics/configs/schedule25000/${OBJ}/${OBJ}_04.txt --ckpt assets/objects/${OBJ}/dynamic_data/mixvoxels/${OBJ}_04/${OBJ}_04.th --n_train_frames 1
cp ./assets/objects/${OBJ}/dynamic_data/mixvoxels/${OBJ}_04/imgs_spiral_hr_all/*.png ./assets/objects/${OBJ}/dynamic_data/mixvoxels/imgs_spiral_hr_all/
python ../models/mixvoxels_brics/render_circle.py --config ../models/mixvoxels_brics/configs/schedule25000/${OBJ}/${OBJ}_05.txt --ckpt assets/objects/${OBJ}/dynamic_data/mixvoxels/${OBJ}_05/${OBJ}_05.th --n_train_frames 1
cp ./assets/objects/${OBJ}/dynamic_data/mixvoxels/${OBJ}_05/imgs_spiral_hr_all/*.png ./assets/objects/${OBJ}/dynamic_data/mixvoxels/imgs_spiral_hr_all/
python ../models/mixvoxels_brics/render_circle.py --config ../models/mixvoxels_brics/configs/schedule25000/${OBJ}/${OBJ}_06.txt --ckpt assets/objects/${OBJ}/dynamic_data/mixvoxels/${OBJ}_06/${OBJ}_06.th --n_train_frames 1
cp ./assets/objects/${OBJ}/dynamic_data/mixvoxels/${OBJ}_06/imgs_spiral_hr_all/*.png ./assets/objects/${OBJ}/dynamic_data/mixvoxels/imgs_spiral_hr_all/
python ../models/mixvoxels_brics/render_circle.py --config ../models/mixvoxels_brics/configs/schedule25000/${OBJ}/${OBJ}_07.txt --ckpt assets/objects/${OBJ}/dynamic_data/mixvoxels/${OBJ}_07/${OBJ}_07.th --n_train_frames 1
cp ./assets/objects/${OBJ}/dynamic_data/mixvoxels/${OBJ}_07/imgs_spiral_hr_all/*.png ./assets/objects/${OBJ}/dynamic_data/mixvoxels/imgs_spiral_hr_all/
python ../models/mixvoxels_brics/render_circle.py --config ../models/mixvoxels_brics/configs/schedule25000/${OBJ}/${OBJ}_08.txt --ckpt assets/objects/${OBJ}/dynamic_data/mixvoxels/${OBJ}_08/${OBJ}_08.th --n_train_frames 1
cp ./assets/objects/${OBJ}/dynamic_data/mixvoxels/${OBJ}_08/imgs_spiral_hr_all/*.png ./assets/objects/${OBJ}/dynamic_data/mixvoxels/imgs_spiral_hr_all/
python ../models/mixvoxels_brics/render_circle.py --config ../models/mixvoxels_brics/configs/schedule25000/${OBJ}/${OBJ}_09.txt --ckpt assets/objects/${OBJ}/dynamic_data/mixvoxels/${OBJ}_09/${OBJ}_09.th --n_train_frames 1
cp ./assets/objects/${OBJ}/dynamic_data/mixvoxels/${OBJ}_09/imgs_spiral_hr_all/*.png ./assets/objects/${OBJ}/dynamic_data/mixvoxels/imgs_spiral_hr_all/
python ../models/mixvoxels_brics/render_circle.py --config ../models/mixvoxels_brics/configs/schedule25000/${OBJ}/${OBJ}_10.txt --ckpt assets/objects/${OBJ}/dynamic_data/mixvoxels/${OBJ}_10/${OBJ}_10.th --n_train_frames 1
cp ./assets/objects/${OBJ}/dynamic_data/mixvoxels/${OBJ}_10/imgs_spiral_hr_all/*.png ./assets/objects/${OBJ}/dynamic_data/mixvoxels/imgs_spiral_hr_all/
python ../models/mixvoxels_brics/render_circle.py --config ../models/mixvoxels_brics/configs/schedule25000/${OBJ}/${OBJ}_11.txt --ckpt assets/objects/${OBJ}/dynamic_data/mixvoxels/${OBJ}_11/${OBJ}_11.th --n_train_frames 1
cp ./assets/objects/${OBJ}/dynamic_data/mixvoxels/${OBJ}_11/imgs_spiral_hr_all/*.png ./assets/objects/${OBJ}/dynamic_data/mixvoxels/imgs_spiral_hr_all/
python ../models/mixvoxels_brics/render_circle.py --config ../models/mixvoxels_brics/configs/schedule25000/${OBJ}/${OBJ}_12.txt --ckpt assets/objects/${OBJ}/dynamic_data/mixvoxels/${OBJ}_12/${OBJ}_12.th --n_train_frames 1
cp ./assets/objects/${OBJ}/dynamic_data/mixvoxels/${OBJ}_12/imgs_spiral_hr_all/*.png ./assets/objects/${OBJ}/dynamic_data/mixvoxels/imgs_spiral_hr_all/
ffmpeg -y -framerate 30 -i ./assets/objects/${OBJ}/dynamic_data/mixvoxels/imgs_spiral_hr_all/cam_%08d.png -b:v 20M -c:v libx264 ./assets/objects/${OBJ}/dynamic_data/mixvoxels/imgs_spiral_hr_all/cams_trajectory.mp4
end=`date +%s`
runtime=$((end-start))
echo $runtime