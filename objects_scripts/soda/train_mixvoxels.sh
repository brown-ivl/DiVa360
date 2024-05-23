OBJ=soda
start=`date +%s`
python3 ../models/mixvoxels_brics/train.py --config ../models/mixvoxels_brics/configs/schedule25000/${OBJ}/${OBJ}_00.txt
python3 ../models/mixvoxels_brics/train.py --config ../models/mixvoxels_brics/configs/schedule25000/${OBJ}/${OBJ}_01.txt
python3 ../models/mixvoxels_brics/train.py --config ../models/mixvoxels_brics/configs/schedule25000/${OBJ}/${OBJ}_02.txt
end=`date +%s`
runtime=$((end-start))
echo $runtime