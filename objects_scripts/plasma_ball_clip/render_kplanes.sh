#!/bin/bash

mkdir ./assets/objects/plasma_ball_clip/dynamic_data/kplanes/traj
PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/plasma_ball_clip/plasma_ball_clip_00.py --render-only --log-dir ./assets/objects/plasma_ball_clip/dynamic_data/kplanes/plasma_ball_clip_00

PYTHONPATH='../models/K-Planes-BRICS/' python ../models/K-Planes-BRICS/plenoxels/main.py --config-path ../models/K-Planes-BRICS/plenoxels/configs/final/Brics/plasma_ball_clip/plasma_ball_clip_01.py --render-only --log-dir ./assets/objects/plasma_ball_clip/dynamic_data/kplanes/plasma_ball_clip_01

ffmpeg -y -framerate 30 -i ./assets/objects/plasma_ball_clip/dynamic_data/kplanes/traj/%05d.png -c:v libx264 -b:v 20M -pix_fmt yuv420p ./assets/objects/plasma_ball_clip/dynamic_data/kplanes/traj.mp4

