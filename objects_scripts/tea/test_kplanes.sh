#!/bin/bash
PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/tea/tea_00.py \
 --validate-only \
 --log-dir assets/objects/tea/dynamic_data/kplanes/tea_00 

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/tea/tea_01.py \
 --validate-only \
 --log-dir assets/objects/tea/dynamic_data/kplanes/tea_01 

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/tea/tea_02.py \
 --validate-only \
 --log-dir assets/objects/tea/dynamic_data/kplanes/tea_02 

