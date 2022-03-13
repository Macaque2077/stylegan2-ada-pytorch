#!/bin/bash

#BATCH --job-name=pytorch_train
#SBATCH -o /nfs/scratch/stanlemich/style_train.out
#SBATCH -e /nfs/scratch/stanlemich/style_train.err
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --mail-user=stanlemich@myvuw.ac.nz
#SBATCH --time=24:00:00
#SBATCH --partition=gpu
#SBATCH --gres=gpu:1
#SBATCH --ntasks=2
#SBATCH --mem=60g

#module unuse /home/software/tools/modulefiles/  #unuse the old module system
#module use /home/software/tools/eb_modulefiles/all/Core #use the new module system
#module load fosscuda/2020b
#module load PyTorch/1.7.1
#module load torchvision/0.8.2-PyTorch-1.7.1
#module load GCC/10.2.0
#module load CUDA/11.1.1
module unuse /home/software/tools/modulefiles/  #unuse the old module system
module use /home/software/tools/eb_modulefiles/all/Core #use the new module system
module load fosscuda/2020b
module load Anaconda3
module load GCC/10.2.0

cd /nfs/scratch/stanlemich/
source /nfs/scratch2/stanlemich/datasetGAN_release/dg_venv/bin/activate

module list

#source /nfs/scratch/stanlemich/venv/bin/activate 

nvidia-smi

nvcc --version

python /nfs/scratch/stanlemich/projects/train.py --outdir "/nfs/scratch/stanlemich/data/out_2022" --data "projects/data/fish_train"  --cfg=auto --workers=1 --gpus=1  --batch=4 --metrics=fid50k 
#--resume=/nfs/scratch2/stanlemich/data/out2/00000-fish_train-auto1-batch4/network-snapshot-001600.pkl

