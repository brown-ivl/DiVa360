#!/bin/bash
PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/soda/soda_00.py \
 --validate-only \
 --log-dir assets/objects/soda/dynamic_data/kplanes/soda_00 

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/soda/soda_01.py \
 --validate-only \
 --log-dir assets/objects/soda/dynamic_data/kplanes/soda_01 

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/soda/soda_02.py \
 --validate-only \
 --log-dir assets/objects/soda/dynamic_data/kplanes/soda_02 

