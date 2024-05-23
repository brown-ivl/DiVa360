#!/bin/bash
PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/blue_car/blue_car_00.py \
 --validate-only \
 --log-dir assets/objects/blue_car/dynamic_data/kplanes/blue_car_00 

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/blue_car/blue_car_01.py \
 --validate-only \
 --log-dir assets/objects/blue_car/dynamic_data/kplanes/blue_car_01 

