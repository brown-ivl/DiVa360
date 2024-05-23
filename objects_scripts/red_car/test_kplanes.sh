#!/bin/bash
PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/red_car/red_car_00.py \
 --validate-only \
 --log-dir assets/objects/red_car/dynamic_data/kplanes/red_car_00 

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/red_car/red_car_01.py \
 --validate-only \
 --log-dir assets/objects/red_car/dynamic_data/kplanes/red_car_01 

