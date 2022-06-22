from PIL import Image
import numpy as np
from skimage import transform 
from skimage.transform import rotate, AffineTransform,warp
from skimage.util import random_noise
from skimage.filters import gaussian
from scipy import ndimage
import cv2
import random
from skimage import img_as_ubyte
import os

# edit for directory with images you would like to augment
image_dir = '/nfs/scratch2/stanlemich/data/crop_datasets/WT2_ALL_CROP_220622/WT3'
out_dir = "../data/wt2_ALL_CROP_220622"

lst_augmentations = []

def save_img(im):
    global out_name
    out_name += 1
#     Image.fromarray(np.resize(im,(256,256))).save("{}/{}.jpg".format(out_dir,out_name))
    Image.fromarray(im).resize((256,256)).save("{}/{}.jpg".format(out_dir,out_name))

def flipud(im):
    save_img(np.flipud(im))

def fliplr(im):
    save_img(np.fliplr(im))

#     not currently used
def im_rotate(im, int_angle):
    img_shape = im.shape
    rot_img = rotate(im, int_angle, resize =False)
    save_img(np.resize(rot_img, img_shape))

def rotate90r(im):
    save_img(np.rot90(im, axes=(0,1)))
    
def rotate90l(im):
    save_img(np.rot90(im,axes=(1,0)))
    
def noise(im):
#     print(im[:10,:10])
    im = random_noise(im)
#     print(im.shape)
#     print((im[:10,:10]*255).astype(int))
    im = (im*255).astype(np.uint8)
    save_img(im)

def blur(im):
#     rand_int = random.choice(range(1,11))
#     print(rand_int)
    save_img(cv2.GaussianBlur(im, (11,11), 0))

def augment(im):
    im = np.array(im)
    save_img(im)
    flipud(im)
    fliplr(im)
    rotate90r(im)
    rotate90l(im)
#     im_rotate(im, 10)
    noise(im)
    blur(im)


if __name__ == "__main__":
    if not os.path.isdir(out_dir): os.mkdir(out_dir)
    global out_name 
    out_name = 100000
    for image in os.listdir(image_dir):
        print(image)
        if ".jpg" in image:
            raw_img = Image.open(image_dir+"/"+image)
            augment(raw_img)
            out_name += 3
            
            
