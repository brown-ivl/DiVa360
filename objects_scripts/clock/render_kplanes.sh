#!/bin/bash

mkdir ./assets/objects/clock/dynamic_data/kplanes/traj
PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/clock/clock_00.py --render-only --log-dir ./assets/objects/clock/dynamic_data/kplanes/clock_00

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/clock/clock_01.py --render-only --log-dir ./assets/objects/clock/dynamic_data/kplanes/clock_01

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/clock/clock_02.py --render-only --log-dir ./assets/objects/clock/dynamic_data/kplanes/clock_02

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/clock/clock_03.py --render-only --log-dir ./assets/objects/clock/dynamic_data/kplanes/clock_03

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/clock/clock_04.py --render-only --log-dir ./assets/objects/clock/dynamic_data/kplanes/clock_04

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/clock/clock_05.py --render-only --log-dir ./assets/objects/clock/dynamic_data/kplanes/clock_05

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/clock/clock_06.py --render-only --log-dir ./assets/objects/clock/dynamic_data/kplanes/clock_06

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/clock/clock_07.py --render-only --log-dir ./assets/objects/clock/dynamic_data/kplanes/clock_07

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/clock/clock_08.py --render-only --log-dir ./assets/objects/clock/dynamic_data/kplanes/clock_08

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/clock/clock_09.py --render-only --log-dir ./assets/objects/clock/dynamic_data/kplanes/clock_09

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/clock/clock_10.py --render-only --log-dir ./assets/objects/clock/dynamic_data/kplanes/clock_10

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/clock/clock_11.py --render-only --log-dir ./assets/objects/clock/dynamic_data/kplanes/clock_11

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/clock/clock_12.py --render-only --log-dir ./assets/objects/clock/dynamic_data/kplanes/clock_12

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/clock/clock_13.py --render-only --log-dir ./assets/objects/clock/dynamic_data/kplanes/clock_13

ffmpeg -y -framerate 30 -i ./assets/objects/clock/dynamic_data/kplanes/traj/%05d.png -c:v libx264 -b:v 20M -pix_fmt yuv420p ./assets/objects/clock/dynamic_data/kplanes/traj.mp4

