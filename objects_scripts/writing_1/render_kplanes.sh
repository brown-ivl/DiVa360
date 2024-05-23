#!/bin/bash

mkdir ./assets/objects/writing_1/dynamic_data/kplanes/traj
PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/writing_1/writing_1_00.py --render-only --log-dir ./assets/objects/writing_1/dynamic_data/kplanes/writing_1_00

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/writing_1/writing_1_01.py --render-only --log-dir ./assets/objects/writing_1/dynamic_data/kplanes/writing_1_01

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/writing_1/writing_1_02.py --render-only --log-dir ./assets/objects/writing_1/dynamic_data/kplanes/writing_1_02

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/writing_1/writing_1_03.py --render-only --log-dir ./assets/objects/writing_1/dynamic_data/kplanes/writing_1_03

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/writing_1/writing_1_04.py --render-only --log-dir ./assets/objects/writing_1/dynamic_data/kplanes/writing_1_04

ffmpeg -y -framerate 30 -i ./assets/objects/writing_1/dynamic_data/kplanes/traj/%05d.png -c:v libx264 -b:v 20M -pix_fmt yuv420p ./assets/objects/writing_1/dynamic_data/kplanes/traj.mp4

