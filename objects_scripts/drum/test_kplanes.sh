#!/bin/bash
PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/drum/drum_00.py \
 --validate-only \
 --log-dir assets/objects/drum/dynamic_data/kplanes/drum_00 

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/drum/drum_01.py \
 --validate-only \
 --log-dir assets/objects/drum/dynamic_data/kplanes/drum_01 

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/drum/drum_02.py \
 --validate-only \
 --log-dir assets/objects/drum/dynamic_data/kplanes/drum_02 

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/drum/drum_03.py \
 --validate-only \
 --log-dir assets/objects/drum/dynamic_data/kplanes/drum_03 

