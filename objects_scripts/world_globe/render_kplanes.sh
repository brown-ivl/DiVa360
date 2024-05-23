#!/bin/bash

mkdir ./assets/objects/world_globe/dynamic_data/kplanes/traj
PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/world_globe/world_globe_00.py --render-only --log-dir ./assets/objects/world_globe/dynamic_data/kplanes/world_globe_00

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/world_globe/world_globe_01.py --render-only --log-dir ./assets/objects/world_globe/dynamic_data/kplanes/world_globe_01

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/world_globe/world_globe_02.py --render-only --log-dir ./assets/objects/world_globe/dynamic_data/kplanes/world_globe_02

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/world_globe/world_globe_03.py --render-only --log-dir ./assets/objects/world_globe/dynamic_data/kplanes/world_globe_03

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/world_globe/world_globe_04.py --render-only --log-dir ./assets/objects/world_globe/dynamic_data/kplanes/world_globe_04

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/world_globe/world_globe_05.py --render-only --log-dir ./assets/objects/world_globe/dynamic_data/kplanes/world_globe_05

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/world_globe/world_globe_06.py --render-only --log-dir ./assets/objects/world_globe/dynamic_data/kplanes/world_globe_06

ffmpeg -y -framerate 30 -i ./assets/objects/world_globe/dynamic_data/kplanes/traj/%05d.png -c:v libx264 -b:v 20M -pix_fmt yuv420p ./assets/objects/world_globe/dynamic_data/kplanes/traj.mp4

