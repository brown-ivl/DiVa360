#!/bin/bash

mkdir ./assets/objects/k1_hand_stand/dynamic_data/kplanes/traj
PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/k1_hand_stand/k1_hand_stand_00.py --render-only --log-dir ./assets/objects/k1_hand_stand/dynamic_data/kplanes/k1_hand_stand_00

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/k1_hand_stand/k1_hand_stand_01.py --render-only --log-dir ./assets/objects/k1_hand_stand/dynamic_data/kplanes/k1_hand_stand_01

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/k1_hand_stand/k1_hand_stand_02.py --render-only --log-dir ./assets/objects/k1_hand_stand/dynamic_data/kplanes/k1_hand_stand_02

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/k1_hand_stand/k1_hand_stand_03.py --render-only --log-dir ./assets/objects/k1_hand_stand/dynamic_data/kplanes/k1_hand_stand_03

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/k1_hand_stand/k1_hand_stand_04.py --render-only --log-dir ./assets/objects/k1_hand_stand/dynamic_data/kplanes/k1_hand_stand_04

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/k1_hand_stand/k1_hand_stand_05.py --render-only --log-dir ./assets/objects/k1_hand_stand/dynamic_data/kplanes/k1_hand_stand_05

ffmpeg -y -framerate 30 -i ./assets/objects/k1_hand_stand/dynamic_data/kplanes/traj/%05d.png -c:v libx264 -b:v 20M -pix_fmt yuv420p ./assets/objects/k1_hand_stand/dynamic_data/kplanes/traj.mp4

