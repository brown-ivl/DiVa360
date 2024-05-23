#!/bin/bash
PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/k1_double_punch/k1_double_punch_00.py \
 --validate-only \
 --log-dir assets/objects/k1_double_punch/dynamic_data/kplanes/k1_double_punch_00 

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/k1_double_punch/k1_double_punch_01.py \
 --validate-only \
 --log-dir assets/objects/k1_double_punch/dynamic_data/kplanes/k1_double_punch_01 

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/k1_double_punch/k1_double_punch_02.py \
 --validate-only \
 --log-dir assets/objects/k1_double_punch/dynamic_data/kplanes/k1_double_punch_02 

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/k1_double_punch/k1_double_punch_03.py \
 --validate-only \
 --log-dir assets/objects/k1_double_punch/dynamic_data/kplanes/k1_double_punch_03 

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/k1_double_punch/k1_double_punch_04.py \
 --validate-only \
 --log-dir assets/objects/k1_double_punch/dynamic_data/kplanes/k1_double_punch_04 

