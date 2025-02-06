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

# 检查是否有足够的命令行参数
if len(sys.argv) < 1:
    print('Error, No Picture is specified!')
    exit
else:
    filename = str(sys.argv[1])


# module config
image_size=224
model = timm.create_model('vit_base_patch16_224', pretrained=True)
torch.save(model, "vit_base_patch16_224_model.pth")
model.eval().half().cuda()
#model.eval().cuda()
config = resolve_data_config({}, model=model)
transform = create_transform(**config)

# picture read
start_index = 1
end_index = 50000  # 假设你想要读取到10000
# 遍历指定范围内的文件
file_path = filename

# 检查文件是否存在
if os.path.exists(file_path):
    picname = file_path
else:
    print(f'文件 {filename} 不存在。')

img0 = Image.open(picname).convert('RGB')
#
img = img0.resize((image_size, image_size))

tensor = transform(img).unsqueeze(0).half().cuda()

a = tensor.cpu().numpy().reshape(3,224,224)

a = torch.from_numpy(a).unsqueeze(0) 
b = F.unfold(a, kernel_size=(16,16), stride=(16,16)).numpy()
np.transpose(b).tofile("test_pic"+".bin")
