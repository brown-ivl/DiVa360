#!/bin/bash
PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/put_candy/put_candy_00.py \
 --validate-only \
 --log-dir assets/objects/put_candy/dynamic_data/kplanes/put_candy_00 

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/put_candy/put_candy_01.py \
 --validate-only \
 --log-dir assets/objects/put_candy/dynamic_data/kplanes/put_candy_01 

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/put_candy/put_candy_02.py \
 --validate-only \
 --log-dir assets/objects/put_candy/dynamic_data/kplanes/put_candy_02 

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/put_candy/put_candy_03.py \
 --validate-only \
 --log-dir assets/objects/put_candy/dynamic_data/kplanes/put_candy_03 

