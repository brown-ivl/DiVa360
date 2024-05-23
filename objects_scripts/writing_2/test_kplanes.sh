#!/bin/bash
PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/writing_2/writing_2_00.py \
 --validate-only \
 --log-dir assets/objects/writing_2/dynamic_data/kplanes/writing_2_00 

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/writing_2/writing_2_01.py \
 --validate-only \
 --log-dir assets/objects/writing_2/dynamic_data/kplanes/writing_2_01 

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/writing_2/writing_2_02.py \
 --validate-only \
 --log-dir assets/objects/writing_2/dynamic_data/kplanes/writing_2_02 

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/writing_2/writing_2_03.py \
 --validate-only \
 --log-dir assets/objects/writing_2/dynamic_data/kplanes/writing_2_03 

