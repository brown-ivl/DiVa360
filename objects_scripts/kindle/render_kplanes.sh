#!/bin/bash

mkdir ./assets/objects/kindle/dynamic_data/kplanes/traj
PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/kindle/kindle_00.py --render-only --log-dir ./assets/objects/kindle/dynamic_data/kplanes/kindle_00

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/kindle/kindle_01.py --render-only --log-dir ./assets/objects/kindle/dynamic_data/kplanes/kindle_01

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/kindle/kindle_02.py --render-only --log-dir ./assets/objects/kindle/dynamic_data/kplanes/kindle_02

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/kindle/kindle_03.py --render-only --log-dir ./assets/objects/kindle/dynamic_data/kplanes/kindle_03

ffmpeg -y -framerate 30 -i ./assets/objects/kindle/dynamic_data/kplanes/traj/%05d.png -c:v libx264 -b:v 20M -pix_fmt yuv420p ./assets/objects/kindle/dynamic_data/kplanes/traj.mp4

