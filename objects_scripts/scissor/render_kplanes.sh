#!/bin/bash

mkdir ./assets/objects/scissor/dynamic_data/kplanes/traj
PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/scissor/scissor_00.py --render-only --log-dir ./assets/objects/scissor/dynamic_data/kplanes/scissor_00

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/scissor/scissor_01.py --render-only --log-dir ./assets/objects/scissor/dynamic_data/kplanes/scissor_01

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/scissor/scissor_02.py --render-only --log-dir ./assets/objects/scissor/dynamic_data/kplanes/scissor_02

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/scissor/scissor_03.py --render-only --log-dir ./assets/objects/scissor/dynamic_data/kplanes/scissor_03

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/scissor/scissor_04.py --render-only --log-dir ./assets/objects/scissor/dynamic_data/kplanes/scissor_04

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/scissor/scissor_05.py --render-only --log-dir ./assets/objects/scissor/dynamic_data/kplanes/scissor_05

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/scissor/scissor_06.py --render-only --log-dir ./assets/objects/scissor/dynamic_data/kplanes/scissor_06

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/scissor/scissor_07.py --render-only --log-dir ./assets/objects/scissor/dynamic_data/kplanes/scissor_07

ffmpeg -y -framerate 30 -i ./assets/objects/scissor/dynamic_data/kplanes/traj/%05d.png -c:v libx264 -b:v 20M -pix_fmt yuv420p ./assets/objects/scissor/dynamic_data/kplanes/traj.mp4

