#!/bin/bash

OBJ=red_car
start=`date +%s`
python3 models/mixvoxels/train.py --config models/mixvoxels/configs/schedule25000/${OBJ}/${OBJ}_1.txt
end=`date +%s`
runtime=$((end-start))
echo $runtime