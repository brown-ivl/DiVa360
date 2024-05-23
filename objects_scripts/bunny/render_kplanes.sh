#!/bin/bash

mkdir ./assets/objects/bunny/dynamic_data/kplanes/traj
PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/bunny/bunny_00.py --render-only --log-dir ./assets/objects/bunny/dynamic_data/kplanes/bunny_00

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/bunny/bunny_01.py --render-only --log-dir ./assets/objects/bunny/dynamic_data/kplanes/bunny_01

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/bunny/bunny_02.py --render-only --log-dir ./assets/objects/bunny/dynamic_data/kplanes/bunny_02

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/bunny/bunny_03.py --render-only --log-dir ./assets/objects/bunny/dynamic_data/kplanes/bunny_03

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/bunny/bunny_04.py --render-only --log-dir ./assets/objects/bunny/dynamic_data/kplanes/bunny_04

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/bunny/bunny_05.py --render-only --log-dir ./assets/objects/bunny/dynamic_data/kplanes/bunny_05

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/bunny/bunny_06.py --render-only --log-dir ./assets/objects/bunny/dynamic_data/kplanes/bunny_06

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/bunny/bunny_07.py --render-only --log-dir ./assets/objects/bunny/dynamic_data/kplanes/bunny_07

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/bunny/bunny_08.py --render-only --log-dir ./assets/objects/bunny/dynamic_data/kplanes/bunny_08

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/bunny/bunny_09.py --render-only --log-dir ./assets/objects/bunny/dynamic_data/kplanes/bunny_09

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/bunny/bunny_10.py --render-only --log-dir ./assets/objects/bunny/dynamic_data/kplanes/bunny_10

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/bunny/bunny_11.py --render-only --log-dir ./assets/objects/bunny/dynamic_data/kplanes/bunny_11

ffmpeg -y -framerate 30 -i ./assets/objects/bunny/dynamic_data/kplanes/traj/%05d.png -c:v libx264 -b:v 20M -pix_fmt yuv420p ./assets/objects/bunny/dynamic_data/kplanes/traj.mp4

