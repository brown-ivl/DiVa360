<div align="center">

# <b>DiVa360</b>: DiVa-360: The Dynamic Visual Dataset for Immersive Neural Fields

Cheng-You Lu<sup>1*</sup>, Peisen Zhou<sup>1*</sup>, Angela Xing<sup>1*</sup>, Chandradeep Pokhariya<sup>2</sup>, Arnab Dey<sup>3</sup>, Ishaan N Shah<sup>2</sup>, Rugved Mavidipalli<sup>1</sup>, Dylan Hu<sup>1</sup>, Andrew Comport<sup>3</sup>, Kefan Chen<sup>1</sup>, Srinath Sridhar<sup>1</sup>

<p><sup>1</sup>Brown University &nbsp;&nbsp;<sup>2</sup>CVIT, IIIT Hyderabad &nbsp;&nbsp;<sup>3</sup>I3S-CNRS/Université Côte d’Azur
<br><sup>*</sup>Corresponding author &nbsp;&nbsp;

### [Projectpage](https://ivl.cs.brown.edu/research/diva.html) · [Paper](https://arxiv.org/abs/2307.16897) · [Video](https://www.youtube.com/watch?v=eWDvmBQP7Uk)

</div>

## Introduction

We propose DiVa360, a real-world 360° dynamic visual dataset containing 21 object-centric sequences categorized by different motion types, 25 intricate hand-object interaction sequences, and 8 long-duration sequences for 17.4M frames.

## Environment

## Directory Structure
<details>
<summary>Example Directory Structure</summary>

```
.
├── assets
│   ├── calib_long
│   │   ├── image
│   │   └── segmented_ngp
│   ├── calib_short
│   │   ├── image
│   │   └── segmented_ngp
│   └── objects
│       ├── blue_car
│       │   ├── calib
│       │   ├── dynamic_data
│       │   │   ├── 150
│       │   │   ├── I-NGP
│       │   │   │   ├── test
│       │   │   │   ├── train
│       │   │   │   └── traj
│       │   │   ├── frames_1
│       │   │   ├── kplanes
│       │   │   │   ├── blue_car_00
│       │   │   │   │   └── test_images
│       │   │   │   ├── blue_car_00_IST
│       │   │   │   ├── blue_car_01
│       │   │   │   ├── blue_car_01_IST
│       │   │   │   ├── test
│       │   │   │   └── traj
│       │   │   ├── mixvoxels
│       │   │   │   ├── imgs_spiral_hr_all
│       │   │   │   └── imgs_test_all
│       │   │   └── stds_1
│       │   ├── image
│       │   ├── segmented_ngp
│       │   └── undist
│       └── …
├── generate_scripts
├── metadata
├── objects_scripts
│   ├── battery
│   ├── blue_car
│   ├── bunny
│   ├── chess
│   ├── chess_long
│   ├── clock
│   ├── crochet
│   ├── dog
│   ├── drum
│   ├── flip_book
│   ├── horse
│   ├── hour_glass
│   ├── jenga
│   ├── jenga_long
│   ├── k1_double_punch
│   ├── k1_hand_stand
│   ├── k1_push_up
│   ├── keyboard_mouse
│   ├── kindle
│   ├── legos
│   ├── maracas
│   ├── music_box
│   ├── origami
│   ├── painting
│   ├── pan
│   ├── peel_apple
│   ├── penguin
│   ├── piano
│   ├── plasma_ball
│   ├── plasma_ball_clip
│   ├── poker
│   ├── pour_salt
│   ├── pour_tea
│   ├── put_candy
│   ├── put_fruit
│   ├── puzzle
│   ├── red_car
│   ├── rubiks_cube
│   ├── scissor
│   ├── slice_apple
│   ├── soda
│   ├── stirling
│   ├── tambourine
│   ├── tea
│   ├── tornado
│   ├── trex
│   ├── truck
│   ├── unlock
│   ├── wall_e
│   ├── wolf
│   ├── world_globe
│   ├── writing_1
│   ├── writing_2
│   └── xylophone
├── src
└── utils

```
</details>

## Instruction for Downloading DiVa360 from AWS S3

### Download raw data
```
aws s3 cp s3://diva360/raw_data/ <path_to_destination> --recursive --no-sign-request
aws s3 cp s3://diva360/raw_data_long/ <path_to_destination> --recursive --no-sign-request
```
### Download preprocess data
```
aws s3 cp s3://diva360/processed_data/ <path_to_destination> --recursive --no-sign-request
aws s3 cp s3://diva360/processed_data_long/ <path_to_destination> --recursive --no-sign-request
```
### Download trained models
```
aws s3 cp s3://diva360/model_data/ <path_to_destination> --recursive --no-sign-request
aws s3 cp s3://diva360/model_data_long/ <path_to_destination> --recursive --no-sign-request
```
You can download a specific object instead of the whole dataset!
### Example
```
aws s3 ls s3://diva360/raw_data/synced/ --no-sign-request
aws s3 cp s3://diva360/raw_data/synced/2023-05-03_session_blue_car_synced.tar.gz ./ --no-sign-request
```

## Benchmark Methods
Please consider citing these methods if you think they are helpful!

[I-NGP](https://github.com/coreqode/instant-ngp)

[MixVoxels](https://github.com/PPPayson/mixvoxels_brics.git)

[K-Planes](https://github.com/johnnylu305/K-Planes-BRICS/tree/kplanes_brics)

## Using existing data
### Take the blue car as an example.
```
# download processed data
aws s3 cp s3://diva360/processed_data/blue_car/ . --recursive --no-sign-request --exclude "*" --include "transforms*"
aws s3 cp s3://diva360/processed_data/blue_car/frames_1.tar.gz ./ --no-sign-request

# please refer to the directory structure section
cp -r frames_1 ../code/DiVa360/assets/objects/blue_car/
cp transforms_* ../code/DiVa360/assets/objects/blue_car/
```

## Run Benchmark
Please install the methods from in the Benchmark Methods section

### I-NPG
```
# Train 
sh objects_scripts/blue_car/train_ingp.sh 

# Test 
sh objects_scripts/blue_car/test_ingp.sh

# Render
sh objects_scripts/blue_car/traj_ingp_hr.sh
```

### MixVoxels
```
# Train 
sh objects_scripts/blue_car/train_mixvoxels.sh

# Test and Benchmark
sh objects_scripts/blue_car/eval_mixvoxels.sh

# Render
sh objects_scripts/blue_car/render_mixvoxels.sh
```

### K-Planes
```
# Train 
sh objects_scripts/blue_car/train_kplanes.sh

# Test
sh objects_scripts/blue_car/test_kplanes.sh

# Render
sh objects_scripts/blue_car/render_kplanes.sh

# Benchmark
python utils/move_kplanes_test.py --root assets/objects/ --name blue_car
python utils/benchmark.py --root assets/objects/blue_car/ --start 0 --num_frames 150 --target_path kplanes/test --wh_bg

```

## Preprocessing
You can also preprocess raw data by yourself.
### Take the blue car as an example.

Download raw data from s3:
```
# list files
aws s3 ls s3://diva360/raw_data/synced/ --no-sign-request

# download raw data
aws s3 cp s3://diva360/raw_data/synced/2023-05-03_session_blue_car_synced.tar.gz ./ --no-sign-request

# decompress file
gzip -d 2023-05-03_session_blue_car_synced.tar.gz
tar -xf 2023-05-03_session_blue_car_synced.tar	

# extract frames from the video
object_scripts/blue_car/move.sh [DATA_PATH]/2023-05-03_session_blue_car_synced/synced
```

Camera pose estimation
```
# download data for pose estimation
aws s3 cp s3://diva360/raw_data/2023-04-29_session_calibration_2.tar ./ --no-sign-request
tar -xf 2023-04-29_session_calibration_2.tar

# if you are using long-duration object, download this one instead
aws s3 cp s3://diva360/raw_data_long/2023-10-21_session_calib.tar.gz ./ --no-sign-request
gzip -d 2023-10-21_session_calib.tar.gz
tar -xf 2023-10-21_session_calib.tar

# run pose estimation with colmap version 3.8
python src/colmap_calib.py -r [DATA_PATH]/2023-04-29_session_calibration_2

# please refer to the directory structure section
mv [DATA_PATH]/2023-04-29_session_calibration_2/params.txt assets/calib_short/
```

Camera pose refinement through I-NGP (please compile the I-NGP from the benchmark method)
```
# manually segment one frame and put it in calib_short
python src/refine_params.py --root_dir assets/calib_short/ --optimize_params --network ../models/instant-ngp/configs/nerf/base.json --roi 0.5 0.45 0.5 --n_steps 10000 --aabb_scale 4 --face_to_cam --gui

# optim_param.txt to transform.json
python utils/params2nerf.py --root assets/calib_short/ --use_kp
```

Segmentation
```
sh objects_scripts/blue_car/segment_frame.sh
```

Undistortion
```
sh objects_scripts/blue_car/undistortion.sh
```

# Citation

If you find this dataset useful for your research, please consider citing:
```bibtex
@inproceedings{diva360,
    title={DiVa-360: The Dynamic Visual Dataset for Immersive Neural Fields},
    author={Cheng-You Lu and Peisen Zhou and Angela Xing and Chandradeep Pokhariya and Arnab Dey and Ishaan N Shah and Rugved Mavidipalli and Dylan Hu and Andrew Comport and Kefan Chen and Srinath Sridhar},
    booktitle = {Conference on Computer Vision and Pattern Recognition 2024},
    year={2024}
}
```
