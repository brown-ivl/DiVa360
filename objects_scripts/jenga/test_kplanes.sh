#!/bin/bash
PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/jenga/jenga_00.py \
 --validate-only \
 --log-dir assets/objects/jenga/dynamic_data/kplanes/jenga_00 

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/jenga/jenga_01.py \
 --validate-only \
 --log-dir assets/objects/jenga/dynamic_data/kplanes/jenga_01 

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/jenga/jenga_02.py \
 --validate-only \
 --log-dir assets/objects/jenga/dynamic_data/kplanes/jenga_02 

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/jenga/jenga_03.py \
 --validate-only \
 --log-dir assets/objects/jenga/dynamic_data/kplanes/jenga_03 

