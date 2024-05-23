#!/bin/bash
PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/unlock/unlock_00.py \
 --validate-only \
 --log-dir assets/objects/unlock/dynamic_data/kplanes/unlock_00 

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/unlock/unlock_01.py \
 --validate-only \
 --log-dir assets/objects/unlock/dynamic_data/kplanes/unlock_01 

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/unlock/unlock_02.py \
 --validate-only \
 --log-dir assets/objects/unlock/dynamic_data/kplanes/unlock_02 

