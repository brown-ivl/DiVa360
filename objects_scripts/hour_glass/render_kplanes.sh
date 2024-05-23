#!/bin/bash

mkdir ./assets/objects/hour_glass/dynamic_data/kplanes/traj
PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/hour_glass/hour_glass_00.py --render-only --log-dir ./assets/objects/hour_glass/dynamic_data/kplanes/hour_glass_00

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/hour_glass/hour_glass_01.py --render-only --log-dir ./assets/objects/hour_glass/dynamic_data/kplanes/hour_glass_01

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/hour_glass/hour_glass_02.py --render-only --log-dir ./assets/objects/hour_glass/dynamic_data/kplanes/hour_glass_02

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/hour_glass/hour_glass_03.py --render-only --log-dir ./assets/objects/hour_glass/dynamic_data/kplanes/hour_glass_03

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/hour_glass/hour_glass_04.py --render-only --log-dir ./assets/objects/hour_glass/dynamic_data/kplanes/hour_glass_04

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/hour_glass/hour_glass_05.py --render-only --log-dir ./assets/objects/hour_glass/dynamic_data/kplanes/hour_glass_05

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/hour_glass/hour_glass_06.py --render-only --log-dir ./assets/objects/hour_glass/dynamic_data/kplanes/hour_glass_06

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/hour_glass/hour_glass_07.py --render-only --log-dir ./assets/objects/hour_glass/dynamic_data/kplanes/hour_glass_07

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/hour_glass/hour_glass_08.py --render-only --log-dir ./assets/objects/hour_glass/dynamic_data/kplanes/hour_glass_08

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/hour_glass/hour_glass_09.py --render-only --log-dir ./assets/objects/hour_glass/dynamic_data/kplanes/hour_glass_09

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/hour_glass/hour_glass_10.py --render-only --log-dir ./assets/objects/hour_glass/dynamic_data/kplanes/hour_glass_10

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/hour_glass/hour_glass_11.py --render-only --log-dir ./assets/objects/hour_glass/dynamic_data/kplanes/hour_glass_11

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/hour_glass/hour_glass_12.py --render-only --log-dir ./assets/objects/hour_glass/dynamic_data/kplanes/hour_glass_12

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/hour_glass/hour_glass_13.py --render-only --log-dir ./assets/objects/hour_glass/dynamic_data/kplanes/hour_glass_13

ffmpeg -y -framerate 30 -i ./assets/objects/hour_glass/dynamic_data/kplanes/traj/%05d.png -c:v libx264 -b:v 20M -pix_fmt yuv420p ./assets/objects/hour_glass/dynamic_data/kplanes/traj.mp4

