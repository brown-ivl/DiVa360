#!/bin/bash

mkdir ./assets/objects/put_fruit/dynamic_data/kplanes/traj
PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/put_fruit/put_fruit_00.py --render-only --log-dir ./assets/objects/put_fruit/dynamic_data/kplanes/put_fruit_00

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/put_fruit/put_fruit_01.py --render-only --log-dir ./assets/objects/put_fruit/dynamic_data/kplanes/put_fruit_01

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/put_fruit/put_fruit_02.py --render-only --log-dir ./assets/objects/put_fruit/dynamic_data/kplanes/put_fruit_02

ffmpeg -y -framerate 30 -i ./assets/objects/put_fruit/dynamic_data/kplanes/traj/%05d.png -c:v libx264 -b:v 20M -pix_fmt yuv420p ./assets/objects/put_fruit/dynamic_data/kplanes/traj.mp4

