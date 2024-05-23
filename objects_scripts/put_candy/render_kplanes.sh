#!/bin/bash

mkdir ./assets/objects/put_candy/dynamic_data/kplanes/traj
PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/put_candy/put_candy_00.py --render-only --log-dir ./assets/objects/put_candy/dynamic_data/kplanes/put_candy_00

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/put_candy/put_candy_01.py --render-only --log-dir ./assets/objects/put_candy/dynamic_data/kplanes/put_candy_01

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/put_candy/put_candy_02.py --render-only --log-dir ./assets/objects/put_candy/dynamic_data/kplanes/put_candy_02

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/put_candy/put_candy_03.py --render-only --log-dir ./assets/objects/put_candy/dynamic_data/kplanes/put_candy_03

ffmpeg -y -framerate 30 -i ./assets/objects/put_candy/dynamic_data/kplanes/traj/%05d.png -c:v libx264 -b:v 20M -pix_fmt yuv420p ./assets/objects/put_candy/dynamic_data/kplanes/traj.mp4

