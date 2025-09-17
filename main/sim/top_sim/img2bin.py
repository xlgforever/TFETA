#import urllib
from PIL import Image
from timm.data import resolve_data_config
from timm.data.transforms_factory import create_transform
import numpy as np
import timm
import torch
import os 
import torch.nn.functional as F
import sys
import warnings
# 禁用Future Warnings
warnings.simplefilter(action='ignore', category=FutureWarning)

# 禁用Future Warnings
#warnings.simplefilter(action='ignore', category=FutureWarning)

if len(sys.argv) < 2:
    print('Error, No Picture is specified!')
    exit
else:
    filename = str(sys.argv[1])
    print('using {} picture'.format(filename))

tile_size = 32
if len(sys.argv) > 2:
    tile_size = int(sys.argv[2])
    print('Tile size {}'.format(tile_size))

# module config
image_size=224
model = timm.create_model('vit_base_patch16_224', pretrained=True)
torch.save(model, "vit_base_patch16_224_model.pth")
model.eval().half().cuda()
#model.eval().cuda()
config = resolve_data_config({}, model=model)
transform = create_transform(**config)

file_path = filename

# 检查文件是否存在
if os.path.exists(file_path):
    picname = file_path
else:
    print(f'file {filename} is not existed')

img0 = Image.open(picname).convert('RGB')
#
img = img0.resize((image_size, image_size))

tensor = transform(img).half().cuda()

a = tensor.cpu().numpy().reshape(3,224,224)

a = torch.from_numpy(a)
# b = F.unfold(a, kernel_size=(16,16), stride=(16,16)).numpy()
#np.transpose(b).tofile("test_pic"+".bin")
a = np.transpose(a)
pad_channels = tile_size - 3  # 32 - 3 = 29
padded_tensor = F.pad(a, (0, pad_channels, 0, 0, 0, 0))
padded_tensor.numpy().tofile('test_pic.bin')
