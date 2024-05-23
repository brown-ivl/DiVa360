#!/bin/bash
PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/piano/piano_00.py \
 --validate-only \
 --log-dir assets/objects/piano/dynamic_data/kplanes/piano_00 

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/piano/piano_01.py \
 --validate-only \
 --log-dir assets/objects/piano/dynamic_data/kplanes/piano_01 

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/piano/piano_02.py \
 --validate-only \
 --log-dir assets/objects/piano/dynamic_data/kplanes/piano_02 

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/piano/piano_03.py \
 --validate-only \
 --log-dir assets/objects/piano/dynamic_data/kplanes/piano_03 

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/piano/piano_04.py \
 --validate-only \
 --log-dir assets/objects/piano/dynamic_data/kplanes/piano_04 

