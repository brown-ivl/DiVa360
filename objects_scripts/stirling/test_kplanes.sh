#!/bin/bash
PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/stirling/stirling_00.py \
 --validate-only \
 --log-dir assets/objects/stirling/dynamic_data/kplanes/stirling_00 

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/stirling/stirling_01.py \
 --validate-only \
 --log-dir assets/objects/stirling/dynamic_data/kplanes/stirling_01 

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/stirling/stirling_02.py \
 --validate-only \
 --log-dir assets/objects/stirling/dynamic_data/kplanes/stirling_02 

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/stirling/stirling_03.py \
 --validate-only \
 --log-dir assets/objects/stirling/dynamic_data/kplanes/stirling_03 

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/stirling/stirling_04.py \
 --validate-only \
 --log-dir assets/objects/stirling/dynamic_data/kplanes/stirling_04 

