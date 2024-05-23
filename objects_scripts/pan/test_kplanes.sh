#!/bin/bash
PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/pan/pan_00.py \
 --validate-only \
 --log-dir assets/objects/pan/dynamic_data/kplanes/pan_00 

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/pan/pan_01.py \
 --validate-only \
 --log-dir assets/objects/pan/dynamic_data/kplanes/pan_01 

