#!/bin/bash
PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/maracas/maracas_00.py \
 --validate-only \
 --log-dir assets/objects/maracas/dynamic_data/kplanes/maracas_00 

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/maracas/maracas_01.py \
 --validate-only \
 --log-dir assets/objects/maracas/dynamic_data/kplanes/maracas_01 

