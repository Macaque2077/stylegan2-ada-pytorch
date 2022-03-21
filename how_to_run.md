## To run on the custom CHCH dataset

## Augment image dataset 
### run augment_images, change the input and output directories at the start of the file 
### Venv_stylegan is used for the data augmentation script 


## create stylegans dataset with 
python dataset_tool.py --source=/nfs/scratch/stanlemich/data/augmented_chch --dest=/nfs/scratch/stanlemich/projects/data/chch_train_data/train.zip --width=256 --height=256
### Venv_ds_gans is for the creation of the tf record with the dataset_tool.py
    
## run training