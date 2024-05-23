#!/bin/bash

mkdir ./assets/objects/tornado/dynamic_data/kplanes/traj
PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/tornado/tornado_00.py --render-only --log-dir ./assets/objects/tornado/dynamic_data/kplanes/tornado_00

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/tornado/tornado_01.py --render-only --log-dir ./assets/objects/tornado/dynamic_data/kplanes/tornado_01

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/tornado/tornado_02.py --render-only --log-dir ./assets/objects/tornado/dynamic_data/kplanes/tornado_02

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/tornado/tornado_03.py --render-only --log-dir ./assets/objects/tornado/dynamic_data/kplanes/tornado_03

ffmpeg -y -framerate 30 -i ./assets/objects/tornado/dynamic_data/kplanes/traj/%05d.png -c:v libx264 -b:v 20M -pix_fmt yuv420p ./assets/objects/tornado/dynamic_data/kplanes/traj.mp4

