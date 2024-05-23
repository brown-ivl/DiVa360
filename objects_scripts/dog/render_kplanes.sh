#!/bin/bash

mkdir ./assets/objects/dog/dynamic_data/kplanes/traj
PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/dog/dog_00.py --render-only --log-dir ./assets/objects/dog/dynamic_data/kplanes/dog_00

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/dog/dog_01.py --render-only --log-dir ./assets/objects/dog/dynamic_data/kplanes/dog_01

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/dog/dog_02.py --render-only --log-dir ./assets/objects/dog/dynamic_data/kplanes/dog_02

ffmpeg -y -framerate 30 -i ./assets/objects/dog/dynamic_data/kplanes/traj/%05d.png -c:v libx264 -b:v 20M -pix_fmt yuv420p ./assets/objects/dog/dynamic_data/kplanes/traj.mp4

