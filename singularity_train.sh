#!/bin/bash

#SBATCH -J singularity-job
#SBATCH -c 4
#SBATCH --mem=16G
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --mail-user=stanlemich@myvuw.ac.nz
#SBATCH --time=5:00:00
#SBATCH -o /nfs/scratch2/stanlemich/sing_train.out
#SBATCH -e /nfs/scratch2/stanlemich/sing_train.err

module load singularity

#singularity pull style.sif library://Docker:latest

#singularity build sg2ada.img docker-daemon://sg2ada:latest 

singularity build sg2ada:latest

#./docker_run.sh python train.py --outdir "data/out_2022" --data "data/fish_train"  --cfg=auto --workers=1 --gpus=1  --batch=16 --metrics=fid50k
