#!/bin/bash

mkdir ./assets/objects/red_car/dynamic_data/kplanes/traj
PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/red_car/red_car_00.py --render-only --log-dir ./assets/objects/red_car/dynamic_data/kplanes/red_car_00

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/red_car/red_car_01.py --render-only --log-dir ./assets/objects/red_car/dynamic_data/kplanes/red_car_01

ffmpeg -y -framerate 30 -i ./assets/objects/red_car/dynamic_data/kplanes/traj/%05d.png -c:v libx264 -b:v 20M -pix_fmt yuv420p ./assets/objects/red_car/dynamic_data/kplanes/traj.mp4

