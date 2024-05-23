#!/bin/bash
PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/chess/chess_00.py \
 --validate-only \
 --log-dir assets/objects/chess/dynamic_data/kplanes/chess_00 

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/chess/chess_01.py \
 --validate-only \
 --log-dir assets/objects/chess/dynamic_data/kplanes/chess_01 

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/chess/chess_02.py \
 --validate-only \
 --log-dir assets/objects/chess/dynamic_data/kplanes/chess_02 

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/chess/chess_03.py \
 --validate-only \
 --log-dir assets/objects/chess/dynamic_data/kplanes/chess_03 

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/chess/chess_04.py \
 --validate-only \
 --log-dir assets/objects/chess/dynamic_data/kplanes/chess_04 

