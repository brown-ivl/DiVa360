#!/bin/bash
PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/slice_apple/slice_apple_00.py \
 --validate-only \
 --log-dir assets/objects/slice_apple/dynamic_data/kplanes/slice_apple_00 

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/slice_apple/slice_apple_01.py \
 --validate-only \
 --log-dir assets/objects/slice_apple/dynamic_data/kplanes/slice_apple_01 

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/slice_apple/slice_apple_02.py \
 --validate-only \
 --log-dir assets/objects/slice_apple/dynamic_data/kplanes/slice_apple_02 

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/slice_apple/slice_apple_03.py \
 --validate-only \
 --log-dir assets/objects/slice_apple/dynamic_data/kplanes/slice_apple_03 

