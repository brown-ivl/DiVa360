#!/bin/bash

OBJ=flip_book_2
start=`date +%s`
python3 models/mixvoxels/train.py --config models/mixvoxels/configs/schedule25000/${OBJ}/${OBJ}_1.txt
#python3 models/mixvoxels/train.py --config models/mixvoxels/configs/schedule25000/${OBJ}/${OBJ}_2.txt

end=`date +%s`
runtime=$((end-start))
echo $runtime