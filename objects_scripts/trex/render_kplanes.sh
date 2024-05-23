#!/bin/bash

mkdir ./assets/objects/trex/dynamic_data/kplanes/traj
PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/trex/trex_00.py --render-only --log-dir ./assets/objects/trex/dynamic_data/kplanes/trex_00

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/trex/trex_01.py --render-only --log-dir ./assets/objects/trex/dynamic_data/kplanes/trex_01

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/trex/trex_02.py --render-only --log-dir ./assets/objects/trex/dynamic_data/kplanes/trex_02

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/trex/trex_03.py --render-only --log-dir ./assets/objects/trex/dynamic_data/kplanes/trex_03

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/trex/trex_04.py --render-only --log-dir ./assets/objects/trex/dynamic_data/kplanes/trex_04

ffmpeg -y -framerate 30 -i ./assets/objects/trex/dynamic_data/kplanes/traj/%05d.png -c:v libx264 -b:v 20M -pix_fmt yuv420p ./assets/objects/trex/dynamic_data/kplanes/traj.mp4

