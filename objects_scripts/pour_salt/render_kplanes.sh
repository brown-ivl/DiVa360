#!/bin/bash

mkdir ./assets/objects/pour_salt/dynamic_data/kplanes/traj
PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/pour_salt/pour_salt_00.py --render-only --log-dir ./assets/objects/pour_salt/dynamic_data/kplanes/pour_salt_00

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/pour_salt/pour_salt_01.py --render-only --log-dir ./assets/objects/pour_salt/dynamic_data/kplanes/pour_salt_01

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/pour_salt/pour_salt_02.py --render-only --log-dir ./assets/objects/pour_salt/dynamic_data/kplanes/pour_salt_02

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/pour_salt/pour_salt_03.py --render-only --log-dir ./assets/objects/pour_salt/dynamic_data/kplanes/pour_salt_03

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/pour_salt/pour_salt_04.py --render-only --log-dir ./assets/objects/pour_salt/dynamic_data/kplanes/pour_salt_04

ffmpeg -y -framerate 30 -i ./assets/objects/pour_salt/dynamic_data/kplanes/traj/%05d.png -c:v libx264 -b:v 20M -pix_fmt yuv420p ./assets/objects/pour_salt/dynamic_data/kplanes/traj.mp4

