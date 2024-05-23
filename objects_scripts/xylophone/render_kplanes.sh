#!/bin/bash

mkdir ./assets/objects/xylophone/dynamic_data/kplanes/traj
PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/xylophone/xylophone_00.py --render-only --log-dir ./assets/objects/xylophone/dynamic_data/kplanes/xylophone_00

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/xylophone/xylophone_01.py --render-only --log-dir ./assets/objects/xylophone/dynamic_data/kplanes/xylophone_01

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/xylophone/xylophone_02.py --render-only --log-dir ./assets/objects/xylophone/dynamic_data/kplanes/xylophone_02

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/xylophone/xylophone_03.py --render-only --log-dir ./assets/objects/xylophone/dynamic_data/kplanes/xylophone_03

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/xylophone/xylophone_04.py --render-only --log-dir ./assets/objects/xylophone/dynamic_data/kplanes/xylophone_04

ffmpeg -y -framerate 30 -i ./assets/objects/xylophone/dynamic_data/kplanes/traj/%05d.png -c:v libx264 -b:v 20M -pix_fmt yuv420p ./assets/objects/xylophone/dynamic_data/kplanes/traj.mp4

