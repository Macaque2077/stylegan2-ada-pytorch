#!/bin/bash

#BATCH --job-name=pytorch_train
#SBATCH -o /nfs/scratch2/stanlemich/project1.out
#SBATCH -e /nfs/scratch2/stanlemich/project1.err
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --mail-user=stanlemich@myvuw.ac.nz
#SBATCH --time=24:00:00
#SBATCH --partition=gpu
#SBATCH --gres=gpu:1
#SBATCH --ntasks=2
#SBATCH --mem=60g

module unuse /home/software/tools/modulefiles/  #unuse the old module system
module use /home/software/tools/eb_modulefiles/all/Core #use the new module system
module load fosscuda/2020b
module load Anaconda3
module load GCC/10.2.0
module load CUDA/11.1.1

source /nfs/scratch2/stanlemich/venv/bin/activate 

python train.py --outdir "/nfs/scratch2/stanlemich/data/out2" --data "data/fish_train"  --cfg=auto --workers=1 --gpus=1  --batch=4 --metrics=fid50k --resume=/nfs/scratch2/stanlemich/data/out2/00000-fish_train-auto1-batch4/network-snapshot-001600.pkl

