#!/bin/bash

mkdir ./assets/objects/piano/dynamic_data/kplanes/traj
PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/piano/piano_00.py --render-only --log-dir ./assets/objects/piano/dynamic_data/kplanes/piano_00

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/piano/piano_01.py --render-only --log-dir ./assets/objects/piano/dynamic_data/kplanes/piano_01

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/piano/piano_02.py --render-only --log-dir ./assets/objects/piano/dynamic_data/kplanes/piano_02

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/piano/piano_03.py --render-only --log-dir ./assets/objects/piano/dynamic_data/kplanes/piano_03

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/piano/piano_04.py --render-only --log-dir ./assets/objects/piano/dynamic_data/kplanes/piano_04

ffmpeg -y -framerate 30 -i ./assets/objects/piano/dynamic_data/kplanes/traj/%05d.png -c:v libx264 -b:v 20M -pix_fmt yuv420p ./assets/objects/piano/dynamic_data/kplanes/traj.mp4

