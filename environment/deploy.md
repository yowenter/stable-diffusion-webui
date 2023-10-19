
# prepare environment

python 3.10.8

create venv:
`python3 -m venv venv`

1. git submodule update --init
2. install torch compiled with cuda

`https://pytorch.org/get-started/locally/`

get nvcc version:
`nvcc --version`

on windows:
`pip3 install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu117`

on linux:
`pip3 install torch torchvision torchaudio -i https://pypi.tuna.tsinghua.edu.cn/simple --trusted-host pypi.tuna.tsinghua.edu.cn `


3. install requirements


set http proxy if needed:

`export http_proxy=http://10.50.26.95:8118`

`export https_proxy=http://10.50.26.95:8118`



`pip install -r environment/zip_requirements.txt `

`pip install -r repositories/CodeFormer/requirements.txt `

`pip install -r requirements_versions.txt`

install xformers

`pip install -U -I --no-deps xformers==0.0.20`

4. install extensions

`cd extensions/sd-webui-controlnet`

`python3 install.py`


4. download model
Downloading: "https://huggingface.co/runwayml/stable-diffusion-v1-5/resolve/main/v1-5-pruned-emaonly.safetensors" to  stable-diffusion-webui/models/Stable-diffusion/v1-5-pruned-emaonly.safetensors


LatentDiffusion: Running in eps-prediction mode...


5. download extensions


open `https://huggingface.co/lllyasviel/ControlNet-v1-1/tree/main`

cd `extensions/sd-webui-controlnet/models/`


`wget https://huggingface.co/lllyasviel/ControlNet-v1-1/resolve/main/control_v11p_sd15_canny.pth`


6. launch 

`bash webui-user.sh `


7. save requirements

`pip freeze > environment/all_in_one_requirements.txt`