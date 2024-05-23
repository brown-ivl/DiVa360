#!/bin/bash

mkdir ./assets/objects/drum/dynamic_data/kplanes/traj
PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/drum/drum_00.py --render-only --log-dir ./assets/objects/drum/dynamic_data/kplanes/drum_00

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/drum/drum_01.py --render-only --log-dir ./assets/objects/drum/dynamic_data/kplanes/drum_01

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/drum/drum_02.py --render-only --log-dir ./assets/objects/drum/dynamic_data/kplanes/drum_02

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/drum/drum_03.py --render-only --log-dir ./assets/objects/drum/dynamic_data/kplanes/drum_03

ffmpeg -y -framerate 30 -i ./assets/objects/drum/dynamic_data/kplanes/traj/%05d.png -c:v libx264 -b:v 20M -pix_fmt yuv420p ./assets/objects/drum/dynamic_data/kplanes/traj.mp4

