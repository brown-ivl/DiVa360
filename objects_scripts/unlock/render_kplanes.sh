#!/bin/bash

mkdir ./assets/objects/unlock/dynamic_data/kplanes/traj
PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/unlock/unlock_00.py --render-only --log-dir ./assets/objects/unlock/dynamic_data/kplanes/unlock_00

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/unlock/unlock_01.py --render-only --log-dir ./assets/objects/unlock/dynamic_data/kplanes/unlock_01

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/unlock/unlock_02.py --render-only --log-dir ./assets/objects/unlock/dynamic_data/kplanes/unlock_02

ffmpeg -y -framerate 30 -i ./assets/objects/unlock/dynamic_data/kplanes/traj/%05d.png -c:v libx264 -b:v 20M -pix_fmt yuv420p ./assets/objects/unlock/dynamic_data/kplanes/traj.mp4

