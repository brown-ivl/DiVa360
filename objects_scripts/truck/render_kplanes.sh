#!/bin/bash

mkdir ./assets/objects/truck/dynamic_data/kplanes/traj
PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/truck/truck_00.py --render-only --log-dir ./assets/objects/truck/dynamic_data/kplanes/truck_00

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/truck/truck_01.py --render-only --log-dir ./assets/objects/truck/dynamic_data/kplanes/truck_01

ffmpeg -y -framerate 30 -i ./assets/objects/truck/dynamic_data/kplanes/traj/%05d.png -c:v libx264 -b:v 20M -pix_fmt yuv420p ./assets/objects/truck/dynamic_data/kplanes/traj.mp4

