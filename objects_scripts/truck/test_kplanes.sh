#!/bin/bash
PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/truck/truck_00.py \
 --validate-only \
 --log-dir assets/objects/truck/dynamic_data/kplanes/truck_00 

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/truck/truck_01.py \
 --validate-only \
 --log-dir assets/objects/truck/dynamic_data/kplanes/truck_01 

