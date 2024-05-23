#!/bin/bash

mkdir ./assets/objects/flip_book/dynamic_data/kplanes/traj
PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/flip_book/flip_book_00.py --render-only --log-dir ./assets/objects/flip_book/dynamic_data/kplanes/flip_book_00

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/flip_book/flip_book_01.py --render-only --log-dir ./assets/objects/flip_book/dynamic_data/kplanes/flip_book_01

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/flip_book/flip_book_02.py --render-only --log-dir ./assets/objects/flip_book/dynamic_data/kplanes/flip_book_02

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/flip_book/flip_book_03.py --render-only --log-dir ./assets/objects/flip_book/dynamic_data/kplanes/flip_book_03

ffmpeg -y -framerate 30 -i ./assets/objects/flip_book/dynamic_data/kplanes/traj/%05d.png -c:v libx264 -b:v 20M -pix_fmt yuv420p ./assets/objects/flip_book/dynamic_data/kplanes/traj.mp4

