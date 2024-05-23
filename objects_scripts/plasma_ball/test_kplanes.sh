#!/bin/bash
PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/plasma_ball/plasma_ball_00.py \
 --validate-only \
 --log-dir assets/objects/plasma_ball/dynamic_data/kplanes/plasma_ball_00 

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/plasma_ball/plasma_ball_01.py \
 --validate-only \
 --log-dir assets/objects/plasma_ball/dynamic_data/kplanes/plasma_ball_01 

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/plasma_ball/plasma_ball_02.py \
 --validate-only \
 --log-dir assets/objects/plasma_ball/dynamic_data/kplanes/plasma_ball_02 

