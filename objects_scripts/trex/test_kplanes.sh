#!/bin/bash
PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/trex/trex_00.py \
 --validate-only \
 --log-dir assets/objects/trex/dynamic_data/kplanes/trex_00 

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/trex/trex_01.py \
 --validate-only \
 --log-dir assets/objects/trex/dynamic_data/kplanes/trex_01 

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/trex/trex_02.py \
 --validate-only \
 --log-dir assets/objects/trex/dynamic_data/kplanes/trex_02 

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/trex/trex_03.py \
 --validate-only \
 --log-dir assets/objects/trex/dynamic_data/kplanes/trex_03 

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/trex/trex_04.py \
 --validate-only \
 --log-dir assets/objects/trex/dynamic_data/kplanes/trex_04 

