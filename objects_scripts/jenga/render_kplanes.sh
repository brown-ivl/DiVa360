#!/bin/bash

mkdir ./assets/objects/jenga/dynamic_data/kplanes/traj
PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/jenga/jenga_00.py --render-only --log-dir ./assets/objects/jenga/dynamic_data/kplanes/jenga_00

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/jenga/jenga_01.py --render-only --log-dir ./assets/objects/jenga/dynamic_data/kplanes/jenga_01

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/jenga/jenga_02.py --render-only --log-dir ./assets/objects/jenga/dynamic_data/kplanes/jenga_02

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/jenga/jenga_03.py --render-only --log-dir ./assets/objects/jenga/dynamic_data/kplanes/jenga_03

ffmpeg -y -framerate 30 -i ./assets/objects/jenga/dynamic_data/kplanes/traj/%05d.png -c:v libx264 -b:v 20M -pix_fmt yuv420p ./assets/objects/jenga/dynamic_data/kplanes/traj.mp4

