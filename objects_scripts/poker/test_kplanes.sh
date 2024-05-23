#!/bin/bash
PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/poker/poker_00.py \
 --validate-only \
 --log-dir assets/objects/poker/dynamic_data/kplanes/poker_00 

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/poker/poker_01.py \
 --validate-only \
 --log-dir assets/objects/poker/dynamic_data/kplanes/poker_01 

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/poker/poker_02.py \
 --validate-only \
 --log-dir assets/objects/poker/dynamic_data/kplanes/poker_02 

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/poker/poker_03.py \
 --validate-only \
 --log-dir assets/objects/poker/dynamic_data/kplanes/poker_03 

