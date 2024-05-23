#!/bin/bash
PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/tornado/tornado_00.py \
 --validate-only \
 --log-dir assets/objects/tornado/dynamic_data/kplanes/tornado_00 

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/tornado/tornado_01.py \
 --validate-only \
 --log-dir assets/objects/tornado/dynamic_data/kplanes/tornado_01 

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/tornado/tornado_02.py \
 --validate-only \
 --log-dir assets/objects/tornado/dynamic_data/kplanes/tornado_02 

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/tornado/tornado_03.py \
 --validate-only \
 --log-dir assets/objects/tornado/dynamic_data/kplanes/tornado_03 

