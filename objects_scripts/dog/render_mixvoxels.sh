OBJ=dog
start=`date +%s`
python ../models/mixvoxels_brics/render_circle.py --config ../models/mixvoxels_brics/configs/schedule25000/${OBJ}/${OBJ}_00.txt --ckpt assets/objects/${OBJ}/dynamic_data/mixvoxels/${OBJ}_00/${OBJ}_00.th --n_train_frames 1
cp ./assets/objects/${OBJ}/dynamic_data/mixvoxels/${OBJ}_00/imgs_spiral_hr_all/*.png ./assets/objects/${OBJ}/dynamic_data/mixvoxels/imgs_spiral_hr_all/
python ../models/mixvoxels_brics/render_circle.py --config ../models/mixvoxels_brics/configs/schedule25000/${OBJ}/${OBJ}_01.txt --ckpt assets/objects/${OBJ}/dynamic_data/mixvoxels/${OBJ}_01/${OBJ}_01.th --n_train_frames 1
cp ./assets/objects/${OBJ}/dynamic_data/mixvoxels/${OBJ}_01/imgs_spiral_hr_all/*.png ./assets/objects/${OBJ}/dynamic_data/mixvoxels/imgs_spiral_hr_all/
python ../models/mixvoxels_brics/render_circle.py --config ../models/mixvoxels_brics/configs/schedule25000/${OBJ}/${OBJ}_02.txt --ckpt assets/objects/${OBJ}/dynamic_data/mixvoxels/${OBJ}_02/${OBJ}_02.th --n_train_frames 1
cp ./assets/objects/${OBJ}/dynamic_data/mixvoxels/${OBJ}_02/imgs_spiral_hr_all/*.png ./assets/objects/${OBJ}/dynamic_data/mixvoxels/imgs_spiral_hr_all/
ffmpeg -y -framerate 30 -i ./assets/objects/${OBJ}/dynamic_data/mixvoxels/imgs_spiral_hr_all/cam_%08d.png -b:v 20M -c:v libx264 ./assets/objects/${OBJ}/dynamic_data/mixvoxels/imgs_spiral_hr_all/cams_trajectory.mp4
end=`date +%s`
runtime=$((end-start))
echo $runtime