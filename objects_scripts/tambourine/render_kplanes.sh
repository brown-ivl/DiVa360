#!/bin/bash

mkdir ./assets/objects/tambourine/dynamic_data/kplanes/traj
PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/tambourine/tambourine_00.py --render-only --log-dir ./assets/objects/tambourine/dynamic_data/kplanes/tambourine_00

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/tambourine/tambourine_01.py --render-only --log-dir ./assets/objects/tambourine/dynamic_data/kplanes/tambourine_01

ffmpeg -y -framerate 30 -i ./assets/objects/tambourine/dynamic_data/kplanes/traj/%05d.png -c:v libx264 -b:v 20M -pix_fmt yuv420p ./assets/objects/tambourine/dynamic_data/kplanes/traj.mp4

