#!/bin/bash
PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/kindle/kindle_00.py \
 --validate-only \
 --log-dir assets/objects/kindle/dynamic_data/kplanes/kindle_00 

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/kindle/kindle_01.py \
 --validate-only \
 --log-dir assets/objects/kindle/dynamic_data/kplanes/kindle_01 

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/kindle/kindle_02.py \
 --validate-only \
 --log-dir assets/objects/kindle/dynamic_data/kplanes/kindle_02 

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/kindle/kindle_03.py \
 --validate-only \
 --log-dir assets/objects/kindle/dynamic_data/kplanes/kindle_03 

