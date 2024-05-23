OBJ=music_box
start=`date +%s`
python3 ../models/mixvoxels_brics/train.py --config ../models/mixvoxels_brics/configs/schedule25000/${OBJ}/${OBJ}_00.txt
python3 ../models/mixvoxels_brics/train.py --config ../models/mixvoxels_brics/configs/schedule25000/${OBJ}/${OBJ}_01.txt
python3 ../models/mixvoxels_brics/train.py --config ../models/mixvoxels_brics/configs/schedule25000/${OBJ}/${OBJ}_02.txt
python3 ../models/mixvoxels_brics/train.py --config ../models/mixvoxels_brics/configs/schedule25000/${OBJ}/${OBJ}_03.txt
python3 ../models/mixvoxels_brics/train.py --config ../models/mixvoxels_brics/configs/schedule25000/${OBJ}/${OBJ}_04.txt
python3 ../models/mixvoxels_brics/train.py --config ../models/mixvoxels_brics/configs/schedule25000/${OBJ}/${OBJ}_05.txt
python3 ../models/mixvoxels_brics/train.py --config ../models/mixvoxels_brics/configs/schedule25000/${OBJ}/${OBJ}_06.txt
python3 ../models/mixvoxels_brics/train.py --config ../models/mixvoxels_brics/configs/schedule25000/${OBJ}/${OBJ}_07.txt
python3 ../models/mixvoxels_brics/train.py --config ../models/mixvoxels_brics/configs/schedule25000/${OBJ}/${OBJ}_08.txt
python3 ../models/mixvoxels_brics/train.py --config ../models/mixvoxels_brics/configs/schedule25000/${OBJ}/${OBJ}_09.txt
python3 ../models/mixvoxels_brics/train.py --config ../models/mixvoxels_brics/configs/schedule25000/${OBJ}/${OBJ}_10.txt
python3 ../models/mixvoxels_brics/train.py --config ../models/mixvoxels_brics/configs/schedule25000/${OBJ}/${OBJ}_11.txt
python3 ../models/mixvoxels_brics/train.py --config ../models/mixvoxels_brics/configs/schedule25000/${OBJ}/${OBJ}_12.txt
python3 ../models/mixvoxels_brics/train.py --config ../models/mixvoxels_brics/configs/schedule25000/${OBJ}/${OBJ}_13.txt
python3 ../models/mixvoxels_brics/train.py --config ../models/mixvoxels_brics/configs/schedule25000/${OBJ}/${OBJ}_14.txt
python3 ../models/mixvoxels_brics/train.py --config ../models/mixvoxels_brics/configs/schedule25000/${OBJ}/${OBJ}_15.txt
python3 ../models/mixvoxels_brics/train.py --config ../models/mixvoxels_brics/configs/schedule25000/${OBJ}/${OBJ}_16.txt
python3 ../models/mixvoxels_brics/train.py --config ../models/mixvoxels_brics/configs/schedule25000/${OBJ}/${OBJ}_17.txt
python3 ../models/mixvoxels_brics/train.py --config ../models/mixvoxels_brics/configs/schedule25000/${OBJ}/${OBJ}_18.txt
python3 ../models/mixvoxels_brics/train.py --config ../models/mixvoxels_brics/configs/schedule25000/${OBJ}/${OBJ}_19.txt
python3 ../models/mixvoxels_brics/train.py --config ../models/mixvoxels_brics/configs/schedule25000/${OBJ}/${OBJ}_20.txt
python3 ../models/mixvoxels_brics/train.py --config ../models/mixvoxels_brics/configs/schedule25000/${OBJ}/${OBJ}_21.txt
python3 ../models/mixvoxels_brics/train.py --config ../models/mixvoxels_brics/configs/schedule25000/${OBJ}/${OBJ}_22.txt
python3 ../models/mixvoxels_brics/train.py --config ../models/mixvoxels_brics/configs/schedule25000/${OBJ}/${OBJ}_23.txt
python3 ../models/mixvoxels_brics/train.py --config ../models/mixvoxels_brics/configs/schedule25000/${OBJ}/${OBJ}_24.txt
python3 ../models/mixvoxels_brics/train.py --config ../models/mixvoxels_brics/configs/schedule25000/${OBJ}/${OBJ}_25.txt
python3 ../models/mixvoxels_brics/train.py --config ../models/mixvoxels_brics/configs/schedule25000/${OBJ}/${OBJ}_26.txt
python3 ../models/mixvoxels_brics/train.py --config ../models/mixvoxels_brics/configs/schedule25000/${OBJ}/${OBJ}_27.txt
python3 ../models/mixvoxels_brics/train.py --config ../models/mixvoxels_brics/configs/schedule25000/${OBJ}/${OBJ}_28.txt
python3 ../models/mixvoxels_brics/train.py --config ../models/mixvoxels_brics/configs/schedule25000/${OBJ}/${OBJ}_29.txt
python3 ../models/mixvoxels_brics/train.py --config ../models/mixvoxels_brics/configs/schedule25000/${OBJ}/${OBJ}_30.txt
python3 ../models/mixvoxels_brics/train.py --config ../models/mixvoxels_brics/configs/schedule25000/${OBJ}/${OBJ}_31.txt
python3 ../models/mixvoxels_brics/train.py --config ../models/mixvoxels_brics/configs/schedule25000/${OBJ}/${OBJ}_32.txt
python3 ../models/mixvoxels_brics/train.py --config ../models/mixvoxels_brics/configs/schedule25000/${OBJ}/${OBJ}_33.txt
python3 ../models/mixvoxels_brics/train.py --config ../models/mixvoxels_brics/configs/schedule25000/${OBJ}/${OBJ}_34.txt
python3 ../models/mixvoxels_brics/train.py --config ../models/mixvoxels_brics/configs/schedule25000/${OBJ}/${OBJ}_35.txt
python3 ../models/mixvoxels_brics/train.py --config ../models/mixvoxels_brics/configs/schedule25000/${OBJ}/${OBJ}_36.txt
python3 ../models/mixvoxels_brics/train.py --config ../models/mixvoxels_brics/configs/schedule25000/${OBJ}/${OBJ}_37.txt
python3 ../models/mixvoxels_brics/train.py --config ../models/mixvoxels_brics/configs/schedule25000/${OBJ}/${OBJ}_38.txt
end=`date +%s`
runtime=$((end-start))
echo $runtime