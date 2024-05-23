#!/bin/bash
PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/wall_e/wall_e_00.py \
 --validate-only \
 --log-dir assets/objects/wall_e/dynamic_data/kplanes/wall_e_00 

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/wall_e/wall_e_01.py \
 --validate-only \
 --log-dir assets/objects/wall_e/dynamic_data/kplanes/wall_e_01 

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/wall_e/wall_e_02.py \
 --validate-only \
 --log-dir assets/objects/wall_e/dynamic_data/kplanes/wall_e_02 

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/wall_e/wall_e_03.py \
 --validate-only \
 --log-dir assets/objects/wall_e/dynamic_data/kplanes/wall_e_03 

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/wall_e/wall_e_04.py \
 --validate-only \
 --log-dir assets/objects/wall_e/dynamic_data/kplanes/wall_e_04 

