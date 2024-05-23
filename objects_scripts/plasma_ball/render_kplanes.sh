#!/bin/bash

mkdir ./assets/objects/plasma_ball/dynamic_data/kplanes/traj
PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/plasma_ball/plasma_ball_00.py --render-only --log-dir ./assets/objects/plasma_ball/dynamic_data/kplanes/plasma_ball_00

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/plasma_ball/plasma_ball_01.py --render-only --log-dir ./assets/objects/plasma_ball/dynamic_data/kplanes/plasma_ball_01

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/plasma_ball/plasma_ball_02.py --render-only --log-dir ./assets/objects/plasma_ball/dynamic_data/kplanes/plasma_ball_02

ffmpeg -y -framerate 30 -i ./assets/objects/plasma_ball/dynamic_data/kplanes/traj/%05d.png -c:v libx264 -b:v 20M -pix_fmt yuv420p ./assets/objects/plasma_ball/dynamic_data/kplanes/traj.mp4

