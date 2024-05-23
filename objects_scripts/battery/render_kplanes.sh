#!/bin/bash

mkdir ./assets/objects/battery/dynamic_data/kplanes/traj
PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/battery/battery_00.py --render-only --log-dir ./assets/objects/battery/dynamic_data/kplanes/battery_00

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/battery/battery_01.py --render-only --log-dir ./assets/objects/battery/dynamic_data/kplanes/battery_01

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/battery/battery_02.py --render-only --log-dir ./assets/objects/battery/dynamic_data/kplanes/battery_02

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/battery/battery_03.py --render-only --log-dir ./assets/objects/battery/dynamic_data/kplanes/battery_03

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/battery/battery_04.py --render-only --log-dir ./assets/objects/battery/dynamic_data/kplanes/battery_04

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/battery/battery_05.py --render-only --log-dir ./assets/objects/battery/dynamic_data/kplanes/battery_05

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/battery/battery_06.py --render-only --log-dir ./assets/objects/battery/dynamic_data/kplanes/battery_06

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/battery/battery_07.py --render-only --log-dir ./assets/objects/battery/dynamic_data/kplanes/battery_07

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/battery/battery_08.py --render-only --log-dir ./assets/objects/battery/dynamic_data/kplanes/battery_08

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/battery/battery_09.py --render-only --log-dir ./assets/objects/battery/dynamic_data/kplanes/battery_09

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/battery/battery_10.py --render-only --log-dir ./assets/objects/battery/dynamic_data/kplanes/battery_10

ffmpeg -y -framerate 30 -i ./assets/objects/battery/dynamic_data/kplanes/traj/%05d.png -c:v libx264 -b:v 20M -pix_fmt yuv420p ./assets/objects/battery/dynamic_data/kplanes/traj.mp4

