#!/bin/bash

mkdir ./assets/objects/poker/dynamic_data/kplanes/traj
PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/poker/poker_00.py --render-only --log-dir ./assets/objects/poker/dynamic_data/kplanes/poker_00

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/poker/poker_01.py --render-only --log-dir ./assets/objects/poker/dynamic_data/kplanes/poker_01

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/poker/poker_02.py --render-only --log-dir ./assets/objects/poker/dynamic_data/kplanes/poker_02

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/poker/poker_03.py --render-only --log-dir ./assets/objects/poker/dynamic_data/kplanes/poker_03

ffmpeg -y -framerate 30 -i ./assets/objects/poker/dynamic_data/kplanes/traj/%05d.png -c:v libx264 -b:v 20M -pix_fmt yuv420p ./assets/objects/poker/dynamic_data/kplanes/traj.mp4

