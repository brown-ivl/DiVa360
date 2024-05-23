#!/bin/bash

mkdir ./assets/objects/keyboard_mouse/dynamic_data/kplanes/traj
PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/keyboard_mouse/keyboard_mouse_00.py --render-only --log-dir ./assets/objects/keyboard_mouse/dynamic_data/kplanes/keyboard_mouse_00

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/keyboard_mouse/keyboard_mouse_01.py --render-only --log-dir ./assets/objects/keyboard_mouse/dynamic_data/kplanes/keyboard_mouse_01

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/keyboard_mouse/keyboard_mouse_02.py --render-only --log-dir ./assets/objects/keyboard_mouse/dynamic_data/kplanes/keyboard_mouse_02

ffmpeg -y -framerate 30 -i ./assets/objects/keyboard_mouse/dynamic_data/kplanes/traj/%05d.png -c:v libx264 -b:v 20M -pix_fmt yuv420p ./assets/objects/keyboard_mouse/dynamic_data/kplanes/traj.mp4

