#!/bin/bash
PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/flip_book/flip_book_00.py \
 --validate-only \
 --log-dir assets/objects/flip_book/dynamic_data/kplanes/flip_book_00 

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/flip_book/flip_book_01.py \
 --validate-only \
 --log-dir assets/objects/flip_book/dynamic_data/kplanes/flip_book_01 

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/flip_book/flip_book_02.py \
 --validate-only \
 --log-dir assets/objects/flip_book/dynamic_data/kplanes/flip_book_02 

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/flip_book/flip_book_03.py \
 --validate-only \
 --log-dir assets/objects/flip_book/dynamic_data/kplanes/flip_book_03 

