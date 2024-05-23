#!/bin/bash
PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/tambourine/tambourine_00.py \
 --validate-only \
 --log-dir assets/objects/tambourine/dynamic_data/kplanes/tambourine_00 

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/tambourine/tambourine_01.py \
 --validate-only \
 --log-dir assets/objects/tambourine/dynamic_data/kplanes/tambourine_01 

