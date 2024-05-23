#!/bin/bash

mkdir ./assets/objects/pan/dynamic_data/kplanes/traj
PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/pan/pan_00.py --render-only --log-dir ./assets/objects/pan/dynamic_data/kplanes/pan_00

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/pan/pan_01.py --render-only --log-dir ./assets/objects/pan/dynamic_data/kplanes/pan_01

ffmpeg -y -framerate 30 -i ./assets/objects/pan/dynamic_data/kplanes/traj/%05d.png -c:v libx264 -b:v 20M -pix_fmt yuv420p ./assets/objects/pan/dynamic_data/kplanes/traj.mp4

