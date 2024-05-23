#!/bin/bash
PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/keyboard_mouse/keyboard_mouse_00.py \
 --validate-only \
 --log-dir assets/objects/keyboard_mouse/dynamic_data/kplanes/keyboard_mouse_00 

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/keyboard_mouse/keyboard_mouse_01.py \
 --validate-only \
 --log-dir assets/objects/keyboard_mouse/dynamic_data/kplanes/keyboard_mouse_01 

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/keyboard_mouse/keyboard_mouse_02.py \
 --validate-only \
 --log-dir assets/objects/keyboard_mouse/dynamic_data/kplanes/keyboard_mouse_02 

