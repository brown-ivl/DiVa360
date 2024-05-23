#!/bin/bash

mkdir ./assets/objects/stirling/dynamic_data/kplanes/traj
PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/stirling/stirling_00.py --render-only --log-dir ./assets/objects/stirling/dynamic_data/kplanes/stirling_00

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/stirling/stirling_01.py --render-only --log-dir ./assets/objects/stirling/dynamic_data/kplanes/stirling_01

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/stirling/stirling_02.py --render-only --log-dir ./assets/objects/stirling/dynamic_data/kplanes/stirling_02

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/stirling/stirling_03.py --render-only --log-dir ./assets/objects/stirling/dynamic_data/kplanes/stirling_03

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/stirling/stirling_04.py --render-only --log-dir ./assets/objects/stirling/dynamic_data/kplanes/stirling_04

ffmpeg -y -framerate 30 -i ./assets/objects/stirling/dynamic_data/kplanes/traj/%05d.png -c:v libx264 -b:v 20M -pix_fmt yuv420p ./assets/objects/stirling/dynamic_data/kplanes/traj.mp4

