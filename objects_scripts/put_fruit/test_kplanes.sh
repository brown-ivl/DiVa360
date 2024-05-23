#!/bin/bash
PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/put_fruit/put_fruit_00.py \
 --validate-only \
 --log-dir assets/objects/put_fruit/dynamic_data/kplanes/put_fruit_00 

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/put_fruit/put_fruit_01.py \
 --validate-only \
 --log-dir assets/objects/put_fruit/dynamic_data/kplanes/put_fruit_01 

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/put_fruit/put_fruit_02.py \
 --validate-only \
 --log-dir assets/objects/put_fruit/dynamic_data/kplanes/put_fruit_02 

