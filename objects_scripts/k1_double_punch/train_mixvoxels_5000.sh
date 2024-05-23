module load ffmpeg/4.0.1 cuda/11.7.1 cudnn/8.2.0 gcc/7.2 glew/2.1.0
OBJ=k1_double_punch
start=`date +%s`
python3 models/mixvoxels/train.py --config models/mixvoxels/configs/schedule5000/${OBJ}/${OBJ}.txt
end=`date +%s`
runtime=$((end-start))
echo $runtime