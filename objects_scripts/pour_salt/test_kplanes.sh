#!/bin/bash
PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/pour_salt/pour_salt_00.py \
 --validate-only \
 --log-dir assets/objects/pour_salt/dynamic_data/kplanes/pour_salt_00 

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/pour_salt/pour_salt_01.py \
 --validate-only \
 --log-dir assets/objects/pour_salt/dynamic_data/kplanes/pour_salt_01 

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/pour_salt/pour_salt_02.py \
 --validate-only \
 --log-dir assets/objects/pour_salt/dynamic_data/kplanes/pour_salt_02 

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/pour_salt/pour_salt_03.py \
 --validate-only \
 --log-dir assets/objects/pour_salt/dynamic_data/kplanes/pour_salt_03 

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/pour_salt/pour_salt_04.py \
 --validate-only \
 --log-dir assets/objects/pour_salt/dynamic_data/kplanes/pour_salt_04 

