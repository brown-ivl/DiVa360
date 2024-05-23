#!/bin/bash

mkdir ./assets/objects/tea/dynamic_data/kplanes/traj
PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/tea/tea_00.py --render-only --log-dir ./assets/objects/tea/dynamic_data/kplanes/tea_00

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/tea/tea_01.py --render-only --log-dir ./assets/objects/tea/dynamic_data/kplanes/tea_01

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/tea/tea_02.py --render-only --log-dir ./assets/objects/tea/dynamic_data/kplanes/tea_02

ffmpeg -y -framerate 30 -i ./assets/objects/tea/dynamic_data/kplanes/traj/%05d.png -c:v libx264 -b:v 20M -pix_fmt yuv420p ./assets/objects/tea/dynamic_data/kplanes/traj.mp4

