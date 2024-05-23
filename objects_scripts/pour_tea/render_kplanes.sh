#!/bin/bash

mkdir ./assets/objects/pour_tea/dynamic_data/kplanes/traj
PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/pour_tea/pour_tea_00.py --render-only --log-dir ./assets/objects/pour_tea/dynamic_data/kplanes/pour_tea_00

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/pour_tea/pour_tea_01.py --render-only --log-dir ./assets/objects/pour_tea/dynamic_data/kplanes/pour_tea_01

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/pour_tea/pour_tea_02.py --render-only --log-dir ./assets/objects/pour_tea/dynamic_data/kplanes/pour_tea_02

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/pour_tea/pour_tea_03.py --render-only --log-dir ./assets/objects/pour_tea/dynamic_data/kplanes/pour_tea_03

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/pour_tea/pour_tea_04.py --render-only --log-dir ./assets/objects/pour_tea/dynamic_data/kplanes/pour_tea_04

ffmpeg -y -framerate 30 -i ./assets/objects/pour_tea/dynamic_data/kplanes/traj/%05d.png -c:v libx264 -b:v 20M -pix_fmt yuv420p ./assets/objects/pour_tea/dynamic_data/kplanes/traj.mp4

