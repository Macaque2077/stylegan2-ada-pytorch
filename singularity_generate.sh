#!/bin/bash

#SBATCH -J singularity_batch16-job
#SBATCH -c 4
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --mail-user=stanlemich@myvuw.ac.nz
#SBATCH --time=23:00:00
#SBATCH -o /nfs/scratch2/stanlemich/sing_generate.out
#SBATCH -e /nfs/scratch2/stanlemich/sing_generate.err
#SBATCH --partition=gpu
#SBATCH --gres=gpu:1
#SBATCH --ntasks=2
#SBATCH --mem=80g

module load singularity

#singularity pull style.sif library://Docker:latest

#singularity build sg2ada.img docker-daemon://sg2ada:latest 

#singularity shell --nv singularity/singularity.simg 


nvidia-smi

#for chch data
singularity run --nv singularity/singularity.simg python /nfs/scratch/stanlemich/projects/generate.py --outdir="/nfs/scratch/stanlemich/data/generated_images/wt2_autocrop_out_070622_batch16" --trunc=1 --seeds=300-500 --network="/nfs/scratch2/stanlemich/data/trained_models/wt2_autocrop_out_070622_batch16/00002-wt2_autocrop_aug_070622-auto1-batch16-resumecustom/network-snapshot-005200.pt"  
#--resume "/nfs/scratch2/stanlemich/data/trained_models/wt2_autocrop_out_070622_batch16/00001-wt2_autocrop_aug_070622-auto1-batch16-resumecustom/network-snapshot-005200.pt"

#singularity run --nv singularity/singularity.simg python /nfs/scratch/stanlemich/projects/train.py --outdir "/nfs/scratch/stanlemich/data/trained_models/chch_seginf_out_050522_batch16" --data "/nfs/scratch/stanlemich/data/seginf_crop_chch/train.zip"  --cfg=auto --workers=1 --gpus=1  --batch=16 --metrics=fid50k --resume "/nfs/scratch2/stanlemich/data/trained_models/chch_seginf_out_050522/00006-train-auto1-batch16-resumecustom/network-snapshot-005000.pt"

#singularity run --nv singularity/singularity.simg python /nfs/scratch/stanlemich/projects/train.py --outdir "/nfs/scratch/stanlemich/data/chch_seginf_out_050522" --data "/nfs/scratch/stanlemich/data/seginf_crop_chch/train.zip"  --cfg=auto --workers=1 --gpus=1  --batch=4 --metrics=fid50k --resume=/nfs/scratch2/stanlemich/data/chch_out_2022_2/00002-train-auto1-batch4/network-snapshot-001000.pt

#for original fish dataset
#singularity run --nv singularity/singularity.simg python train.py --outdir "data/out_2022" --data "data/fish_train"  --cfg=auto --workers=1 --gpus=1  --batch=16 --metrics=fid50k

exit
exit
#../docker_run.sh python train.py --outdir "data/out_2022" --data "data/fish_train"  --cfg=auto --workers=1 --gpus=1  --batch=16 --metrics=fid50k

