#!/bin/bash

mkdir ./assets/objects/penguin/dynamic_data/kplanes/traj
PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/penguin/penguin_00.py --render-only --log-dir ./assets/objects/penguin/dynamic_data/kplanes/penguin_00

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/penguin/penguin_01.py --render-only --log-dir ./assets/objects/penguin/dynamic_data/kplanes/penguin_01

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/penguin/penguin_02.py --render-only --log-dir ./assets/objects/penguin/dynamic_data/kplanes/penguin_02

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/penguin/penguin_03.py --render-only --log-dir ./assets/objects/penguin/dynamic_data/kplanes/penguin_03

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/penguin/penguin_04.py --render-only --log-dir ./assets/objects/penguin/dynamic_data/kplanes/penguin_04

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/penguin/penguin_05.py --render-only --log-dir ./assets/objects/penguin/dynamic_data/kplanes/penguin_05

ffmpeg -y -framerate 30 -i ./assets/objects/penguin/dynamic_data/kplanes/traj/%05d.png -c:v libx264 -b:v 20M -pix_fmt yuv420p ./assets/objects/penguin/dynamic_data/kplanes/traj.mp4

