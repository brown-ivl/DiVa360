<div align="center">

# <b>DiVa360</b>: DiVa-360: The Dynamic Visual Dataset for Immersive Neural Fields

Cheng-You Lu<sup>1*</sup>, Peisen Zhou<sup>1*</sup>, Angela Xing<sup>1*</sup>, Chandradeep Pokhariya<sup>2</sup>, Arnab Dey<sup>3</sup>, Ishaan N Shah<sup>2</sup>, Rugved Mavidipalli<sup>1</sup>, Dylan Hu<sup>1</sup>, Andrew Comport<sup>3</sup>, Kefan Chen<sup>1</sup>, Srinath Sridhar<sup>1</sup>

<p><sup>1</sup>Brown University &nbsp;&nbsp;<sup>2</sup>CVIT, IIIT Hyderabad &nbsp;&nbsp;<sup>3</sup>I3S-CNRS/Université Côte d’Azur
<br><sup>*</sup>Corresponding author &nbsp;&nbsp;

### [Projectpage](https://ivl.cs.brown.edu/research/diva.html) · [Paper](https://arxiv.org/abs/2307.16897) · [Video](https://www.youtube.com/watch?v=eWDvmBQP7Uk)

</div>

## Introduction

We propose DiVa360, a real-world 360° dynamic visual dataset containing 21 object-centric sequences categorized by different motion types, 25 intricate hand-object interaction sequences, and 8 long-duration sequences for 17.4M frames.

https://github.com/brown-ivl/DiVa360/assets/22707984/4ac89255-40d7-4754-bb78-99b96c76852f

## Environment
Build conda environment using ```environment.yml```, then follow instructions in each benchmark method to install required packages. 
```
conda env create --file environment.yml
conda activate diva360_venv
```
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

<!-- ## Instruction for Downloading DiVa360 from AWS S3

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
``` -->

## Instruction for Downloading DiVa360 from AWS S3
### Setup
We store our dataset on Globus, so to download the data to your local machine, we use Globus Command Line Interface (Globus-CLI) and Globus Connect Personal (GCP). You will first need to install GCP. Follow these intructions depending on your machine: [Mac](https://docs.globus.org/globus-connect-personal/install/mac/), [Windows](https://docs.globus.org/how-to/globus-connect-personal-windows/), [Linux](https://docs.globus.org/how-to/globus-connect-personal-linux/).

Note: When you are installing GCP, you will have to name your collection/endpoint. You are free to name it however you choose, but we suggest naming it "&lt;name&gt; personal machine". 

Next, you will need to install Globus-CLI and login. Run the following commands:
```
pip install globus-cli
globus login
```
This will take you to a login page. You can either log in through a listed institution, through any Google account, or through an ORCID iD. After logging in, you will see a terms of service page. To continue, click "Allow".
To download the data, you will be copying the data from the DiVa360 endpoint to the endpoint you just created on your local machine when you installed GCP. First, setup the DiVa360 endpoint:
```
diva360_ep=8ac249c5-8d25-4faa-9247-745d0213c615
```
Next, setup your personal endpoint for your local machine:
```
globus endpoint local-id
personal_ep=<output of the above command>
```
**Important Note: To transfer to your GCP endpoint, the GCP software must be running and connected for the transfer to complete. However, you can close your terminal after the transfer has started.**

### Download
Downloading raw data (note that this is a total of 1.4 TB of data):
```
# Download all raw data
globus transfer $diva360_ep:/raw_data/ $personal_ep:<path to destination> --recursive
globus transfer $diva360_ep:/raw_data_long/ $personal_ep:<path to destination> --recursive

# Downloading a single sequence
globus transfer $diva360_ep:/raw_data/synced/2023-05-02_session_<sequence>_synced.tar.gz $personal_ep:<path to destination>/2023-05-02_session_<sequence>_synced.tar.gz
globus transfer $diva360_ep:/raw_data_long/synced/2023-10-21_session_<sequence>_synced.tar.gz $personal_ep:<path to destination>/2023-10-21_session_<sequence>_synced.tar.gz
```
Downloading processed data (note that this is a total of 1.8 TB of data):
```
# Download all processed data
globus transfer $diva360_ep:/processed_data/ $personal_ep:<path to destination> --recursive
globus transfer $diva360_ep:/processed_data_long/ $personal_ep:<path to destination> --recursive

# Downloading a single sequence
globus transfer $diva360_ep:/processed_data/<sequence>/ $personal_ep:<path to destination> --recursive
globus transfer $diva360_ep:/processed_data_long/<sequence>/ $personal_ep:<path to destination> --recursive
```
Downloading trained models (note that this is a total of 6 TB of data):
```
globus transfer $diva360_ep:/model_data/ $personal_ep:<path to destination> --recursive
globus transfer $diva360_ep:/model_data_long/ $personal_ep:<path to destination> --recursive
globus transfer $diva360_ep:/model_data_exp/ $personal_ep:<path to destination> --recursive
```
Downloading rendered videos (note that this is a total of 63.1 GB of data):
```
globus transfer $diva360_ep:/all_videos/ $personal_ep:<path to destination> --recursive
```
You can also transfer multiple files or folders at once using the batch transfer feature. Here is an example:
```
globus transfer --batch batch_transfer.txt $diva360_ep $personal_ep
```
Assuming you have the following `batch_transfer.txt` file:
```
# Copy a file
<path to file> <path to destination>/<file name>

# Copy a folder
<path to folder> <path to destination>/<folder name> --recursive
```
To check the status of your transfer, use the following command:
```
globus task show <task ID>
```

### Sequences
<details>
<summary>Here are a list of sequences</summary>
    <div style="display: flex; flex-direction: row;">
        <div>
            <ul style="list-style: none;">
                <li>battery</li>
                <li>blue_car</li>
                <li>bunny</li>
                <li>chess</li>
                <li>clock</li>
                <li>dog</li>
                <li>drum</li>
                <li>flip_book</li>
                <li>horse</li>
                <li>hour_glass</li>
                <li>jenga</li>
                <li>k1_double_punch</li>
                <li>k1_hand_stand</li>
                <li>k1_push_up</li>
                <li>keyboard_mouse</li>
                <li>kindle</li>
            </ul>
        </div>
        <div>
            <ul style="list-style: none;">
                <li>maracas</li>
                <li>music_box</li>
                <li>pan</li>
                <li>peel_apple</li>
                <li>penguin</li>
                <li>piano</li>
                <li>plasma_ball</li>
                <li>plasma_ball_clip</li>
                <li>poker</li>
                <li>pour_salt</li>
                <li>pour_tea</li>
                <li>put_candy</li>
                <li>put_fruit</li>
                <li>red_car</li>
                <li>scissor</li>
            </ul>
        </div>
        <div>
            <ul style="list-style: none;">
                <li>slice_apple</li>
                <li>soda</li>
                <li>stirling</li>
                <li>tambourine</li>
                <li>tea</li>
                <li>tornado</li>
                <li>trex</li>
                <li>truck</li>
                <li>unlock</li>
                <li>wall_e</li>
                <li>wolf</li>
                <li>world_globe</li>
                <li>writing_1</li>
                <li>writing_2</li>
                <li>xylophone</li>
            </ul>
        </div>
    </div>
</details>

<details>
<summary>Here are a list of long sequences</summary>
    <div style="display: flex; flex-direction: row;">
        <div>
            <ul style="list-style: none;">
                <li>chess_long</li>
                <li>crochet</li>
            </ul>
        </div>
        <div>
            <ul style="list-style: none;">
                <li>jenga_long</li>
                <li>legos</li>
            </ul>
        </div>
        <div>
            <ul style="list-style: none;">
                <li>origami</li>
                <li>painting</li>
            </ul>
        </div>
        <div>
            <ul style="list-style: none;">
                <li>puzzle</li>
                <li>rubiks_cube</li>
            </ul>
        </div>
    </div>
</details>


## Benchmark Methods
Please consider citing these methods if you think they are helpful! Below are methods modified for DiVa360 benchmarks.

[I-NGP](https://github.com/coreqode/instant-ngp)

[MixVoxels](https://github.com/PPPayson/mixvoxels_brics.git)

[K-Planes](https://github.com/johnnylu305/K-Planes-BRICS/tree/kplanes_brics)

## Using existing data
### Take the blue car as an example.
```
# Download processed data
globus transfer --exclude "*" --include "transforms*" $diva360_ep:/processed_data/blue_car $personal_ep:<path to destination> --recursive
globus transfer $diva360_ep:/processed_data/blue_car/frames_1.tar.gz $personal_ep:<path to destination>/frames_1.tar.gz --recursive

# Please refer to the directory structure section
cp -r frames_1 ../code/DiVa360/assets/objects/blue_car/
cp transforms_* ../code/DiVa360/assets/objects/blue_car/
```

## Run Benchmark
Please install the methods from in the Benchmark Methods section

### I-NPG
```
# Train 
sh objects_scripts/blue_car/train_ingp.sh 

# Test and Benchmark
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
# Download raw data
globus transfer $diva360_ep:/raw_data/synced/2023-05-02_session_blue_car_synced.tar.gz $personal_ep:<path to destination>/2023-05-02_session_blue_car_synced.tar.gz --recursive

# Decompress file
gzip -d 2023-05-02_session_blue_car_synced.tar.gz
tar -xf 2023-05-02_session_blue_car_synced.tar	

# Extract frames from the video
object_scripts/blue_car/move.sh <data path>/2023-05-02_session_blue_car_synced/synced
```

Camera pose estimation
```
# Download data for pose estimation
globus transfer $diva360_ep:/raw_data/2023-04-29_session_calibration_2.tar $personal_ep:<path to destination>/2023-04-29_session_calibration_2.tar
tar -xf 2023-04-29_session_calibration_2.tar

# If you are using long-duration object, download this one instead
globus transfer  $diva360_ep:/raw_data_long/2023-10-21_session_calib.tar.gz $personal_ep:<path to destination>/2023-10-21_session_calib.tar
gzip -d 2023-10-21_session_calib.tar.gz
tar -xf 2023-10-21_session_calib.tar

# Run pose estimation with colmap version 3.8
python src/colmap_calib.py -r <data path>/2023-04-29_session_calibration_2

# Please refer to the directory structure section
mv <data path>/2023-04-29_session_calibration_2/params.txt assets/calib_short/
```

Camera pose refinement through I-NGP (please compile the I-NGP from the benchmark method)
```
# Manually segment one frame and put it in calib_short
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

## Frequently Asked Questions (FAQ)

__Q:__ What is the coordination system of the transform.json?

__A:__ It follows the original NeRF coordinate system. The transform.json follows the I-NGP style, which can be used like the fox example. Please check [nerfstudio](https://docs.nerf.studio/quickstart/data_conventions.html) for the details.

##

__Q:__ How can I use it on other methods?

__A:__ We suggest using llff or blender dataloader if the codebase supports it. The codebase should support the intrinsic matrix per camera.

##

__Q:__ Why does the I-NGP segmentation not work well?

__A:__ This is common situation. Tuning the parameter can solve the problem most of the time. We point out the limitations in the paper. hour_glass, plasma_ball, and plasma_ball_clip are segmented manually.

##

__Q:__ Do I need to manually segment each object's first frame?

__A:__ No, you can reuse the refined pose for other objects captured on the same date.


# TODO

- [ ] add Gaussian Splatting to the benchmark

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
