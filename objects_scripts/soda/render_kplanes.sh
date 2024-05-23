#!/bin/bash

mkdir ./assets/objects/soda/dynamic_data/kplanes/traj
PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/soda/soda_00.py --render-only --log-dir ./assets/objects/soda/dynamic_data/kplanes/soda_00

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/soda/soda_01.py --render-only --log-dir ./assets/objects/soda/dynamic_data/kplanes/soda_01

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/soda/soda_02.py --render-only --log-dir ./assets/objects/soda/dynamic_data/kplanes/soda_02

ffmpeg -y -framerate 30 -i ./assets/objects/soda/dynamic_data/kplanes/traj/%05d.png -c:v libx264 -b:v 20M -pix_fmt yuv420p ./assets/objects/soda/dynamic_data/kplanes/traj.mp4

