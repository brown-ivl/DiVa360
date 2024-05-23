#!/bin/bash
PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/dog/dog_00.py \
 --validate-only \
 --log-dir assets/objects/dog/dynamic_data/kplanes/dog_00 

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/dog/dog_01.py \
 --validate-only \
 --log-dir assets/objects/dog/dynamic_data/kplanes/dog_01 

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/dog/dog_02.py \
 --validate-only \
 --log-dir assets/objects/dog/dynamic_data/kplanes/dog_02 

