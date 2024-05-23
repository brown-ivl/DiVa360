#!/bin/bash

mkdir ./assets/objects/k1_push_up/dynamic_data/kplanes/traj
PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/k1_push_up/k1_push_up_00.py --render-only --log-dir ./assets/objects/k1_push_up/dynamic_data/kplanes/k1_push_up_00

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/k1_push_up/k1_push_up_01.py --render-only --log-dir ./assets/objects/k1_push_up/dynamic_data/kplanes/k1_push_up_01

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/k1_push_up/k1_push_up_02.py --render-only --log-dir ./assets/objects/k1_push_up/dynamic_data/kplanes/k1_push_up_02

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/k1_push_up/k1_push_up_03.py --render-only --log-dir ./assets/objects/k1_push_up/dynamic_data/kplanes/k1_push_up_03

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/k1_push_up/k1_push_up_04.py --render-only --log-dir ./assets/objects/k1_push_up/dynamic_data/kplanes/k1_push_up_04

ffmpeg -y -framerate 30 -i ./assets/objects/k1_push_up/dynamic_data/kplanes/traj/%05d.png -c:v libx264 -b:v 20M -pix_fmt yuv420p ./assets/objects/k1_push_up/dynamic_data/kplanes/traj.mp4

