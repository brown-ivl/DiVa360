#!/bin/bash

mkdir ./assets/objects/slice_apple/dynamic_data/kplanes/traj
PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/slice_apple/slice_apple_00.py --render-only --log-dir ./assets/objects/slice_apple/dynamic_data/kplanes/slice_apple_00

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/slice_apple/slice_apple_01.py --render-only --log-dir ./assets/objects/slice_apple/dynamic_data/kplanes/slice_apple_01

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/slice_apple/slice_apple_02.py --render-only --log-dir ./assets/objects/slice_apple/dynamic_data/kplanes/slice_apple_02

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/slice_apple/slice_apple_03.py --render-only --log-dir ./assets/objects/slice_apple/dynamic_data/kplanes/slice_apple_03

ffmpeg -y -framerate 30 -i ./assets/objects/slice_apple/dynamic_data/kplanes/traj/%05d.png -c:v libx264 -b:v 20M -pix_fmt yuv420p ./assets/objects/slice_apple/dynamic_data/kplanes/traj.mp4

