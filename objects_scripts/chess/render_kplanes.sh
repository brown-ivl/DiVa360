#!/bin/bash

mkdir ./assets/objects/chess/dynamic_data/kplanes/traj
PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/chess/chess_00.py --render-only --log-dir ./assets/objects/chess/dynamic_data/kplanes/chess_00

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/chess/chess_01.py --render-only --log-dir ./assets/objects/chess/dynamic_data/kplanes/chess_01

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/chess/chess_02.py --render-only --log-dir ./assets/objects/chess/dynamic_data/kplanes/chess_02

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/chess/chess_03.py --render-only --log-dir ./assets/objects/chess/dynamic_data/kplanes/chess_03

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/chess/chess_04.py --render-only --log-dir ./assets/objects/chess/dynamic_data/kplanes/chess_04

ffmpeg -y -framerate 30 -i ./assets/objects/chess/dynamic_data/kplanes/traj/%05d.png -c:v libx264 -b:v 20M -pix_fmt yuv420p ./assets/objects/chess/dynamic_data/kplanes/traj.mp4

