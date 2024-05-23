#!/bin/bash

mkdir ./assets/objects/k1_double_punch/dynamic_data/kplanes/traj
PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/k1_double_punch/k1_double_punch_00.py --render-only --log-dir ./assets/objects/k1_double_punch/dynamic_data/kplanes/k1_double_punch_00

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/k1_double_punch/k1_double_punch_01.py --render-only --log-dir ./assets/objects/k1_double_punch/dynamic_data/kplanes/k1_double_punch_01

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/k1_double_punch/k1_double_punch_02.py --render-only --log-dir ./assets/objects/k1_double_punch/dynamic_data/kplanes/k1_double_punch_02

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/k1_double_punch/k1_double_punch_03.py --render-only --log-dir ./assets/objects/k1_double_punch/dynamic_data/kplanes/k1_double_punch_03

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/k1_double_punch/k1_double_punch_04.py --render-only --log-dir ./assets/objects/k1_double_punch/dynamic_data/kplanes/k1_double_punch_04

ffmpeg -y -framerate 30 -i ./assets/objects/k1_double_punch/dynamic_data/kplanes/traj/%05d.png -c:v libx264 -b:v 20M -pix_fmt yuv420p ./assets/objects/k1_double_punch/dynamic_data/kplanes/traj.mp4

