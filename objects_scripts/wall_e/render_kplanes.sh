#!/bin/bash

mkdir ./assets/objects/wall_e/dynamic_data/kplanes/traj
PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/wall_e/wall_e_00.py --render-only --log-dir ./assets/objects/wall_e/dynamic_data/kplanes/wall_e_00

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/wall_e/wall_e_01.py --render-only --log-dir ./assets/objects/wall_e/dynamic_data/kplanes/wall_e_01

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/wall_e/wall_e_02.py --render-only --log-dir ./assets/objects/wall_e/dynamic_data/kplanes/wall_e_02

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/wall_e/wall_e_03.py --render-only --log-dir ./assets/objects/wall_e/dynamic_data/kplanes/wall_e_03

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/wall_e/wall_e_04.py --render-only --log-dir ./assets/objects/wall_e/dynamic_data/kplanes/wall_e_04

ffmpeg -y -framerate 30 -i ./assets/objects/wall_e/dynamic_data/kplanes/traj/%05d.png -c:v libx264 -b:v 20M -pix_fmt yuv420p ./assets/objects/wall_e/dynamic_data/kplanes/traj.mp4

