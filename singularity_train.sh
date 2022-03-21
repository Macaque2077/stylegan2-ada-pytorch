#!/bin/bash

#SBATCH -J singularity-job
#SBATCH -c 4
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --mail-user=stanlemich@myvuw.ac.nz
#SBATCH --time=12:00:00
#SBATCH -o /nfs/scratch2/stanlemich/sing_train.out
#SBATCH -e /nfs/scratch2/stanlemich/sing_train.err
#SBATCH --partition=gpu
#SBATCH --gres=gpu:1
#SBATCH --ntasks=2
#SBATCH --mem=60g

module load singularity

#singularity pull style.sif library://Docker:latest

#singularity build sg2ada.img docker-daemon://sg2ada:latest 

#singularity shell --nv singularity/singularity.simg 


nvidia-smi

#for chch data
singularity run --nv singularity/singularity.simg python /nfs/scratch/stanlemich/projects/train.py --outdir "/nfs/scratch/stanlemich/data/chch_out_2022_2" --data "/nfs/scratch/stanlemich/projects/data/chch_train_data/train.zip"  --cfg=auto --workers=1 --gpus=1  --batch=8 --metrics=fid50k 

#--resume=/nfs/scratch2/stanlemich/data/chch_out_2022_2/00000-train-auto1-batch8/network-snapshot-002000.pkl


#for original fish dataset
#singularity run --nv singularity/singularity.simg python train.py --outdir "data/out_2022" --data "data/fish_train"  --cfg=auto --workers=1 --gpus=1  --batch=16 --metrics=fid50k

exit
exit
#../docker_run.sh python train.py --outdir "data/out_2022" --data "data/fish_train"  --cfg=auto --workers=1 --gpus=1  --batch=16 --metrics=fid50k

