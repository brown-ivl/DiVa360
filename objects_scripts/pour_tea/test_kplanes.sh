#!/bin/bash
PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/pour_tea/pour_tea_00.py \
 --validate-only \
 --log-dir assets/objects/pour_tea/dynamic_data/kplanes/pour_tea_00 

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/pour_tea/pour_tea_01.py \
 --validate-only \
 --log-dir assets/objects/pour_tea/dynamic_data/kplanes/pour_tea_01 

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/pour_tea/pour_tea_02.py \
 --validate-only \
 --log-dir assets/objects/pour_tea/dynamic_data/kplanes/pour_tea_02 

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/pour_tea/pour_tea_03.py \
 --validate-only \
 --log-dir assets/objects/pour_tea/dynamic_data/kplanes/pour_tea_03 

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/pour_tea/pour_tea_04.py \
 --validate-only \
 --log-dir assets/objects/pour_tea/dynamic_data/kplanes/pour_tea_04 

