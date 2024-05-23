#!/bin/bash
PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/plasma_ball_clip/plasma_ball_clip_00.py \
 --validate-only \
 --log-dir assets/objects/plasma_ball_clip/dynamic_data/kplanes/plasma_ball_clip_00 

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/plasma_ball_clip/plasma_ball_clip_01.py \
 --validate-only \
 --log-dir assets/objects/plasma_ball_clip/dynamic_data/kplanes/plasma_ball_clip_01 

