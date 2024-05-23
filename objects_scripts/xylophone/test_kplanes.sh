#!/bin/bash
PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/xylophone/xylophone_00.py \
 --validate-only \
 --log-dir assets/objects/xylophone/dynamic_data/kplanes/xylophone_00 

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/xylophone/xylophone_01.py \
 --validate-only \
 --log-dir assets/objects/xylophone/dynamic_data/kplanes/xylophone_01 

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/xylophone/xylophone_02.py \
 --validate-only \
 --log-dir assets/objects/xylophone/dynamic_data/kplanes/xylophone_02 

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/xylophone/xylophone_03.py \
 --validate-only \
 --log-dir assets/objects/xylophone/dynamic_data/kplanes/xylophone_03 

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/xylophone/xylophone_04.py \
 --validate-only \
 --log-dir assets/objects/xylophone/dynamic_data/kplanes/xylophone_04 

