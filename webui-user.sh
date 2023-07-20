#!/bin/bash
#########################################################
# Uncomment and change the variables below to your need:#
#########################################################

# Install directory without trailing slash
#install_dir="/home/$(whoami)"

# Name of the subdirectory
#clone_dir="stable-diffusion-webui"

# Commandline arguments for webui.py, for example: export COMMANDLINE_ARGS="--medvram --opt-split-attention"
#export COMMANDLINE_ARGS=""

# python3 executable
python_cmd="python3"

# git executable
export GIT="git"

# python3 venv without trailing slash (defaults to ${install_dir}/${clone_dir}/venv)
venv_dir="venv"

# script to launch to start the app
export LAUNCH_SCRIPT="launch.py"

# install command for torch
# export TORCH_COMMAND="pip install torch==1.12.1+cu113 --extra-index-url https://download.pytorch.org/whl/cu113"

# Requirements file to use for stable-diffusion-webui
export REQS_FILE="requirements_versions.txt"

# Fixed git repos
#export K_DIFFUSION_PACKAGE=""
#export GFPGAN_PACKAGE=""

# Fixed git commits
#export STABLE_DIFFUSION_COMMIT_HASH=""
#export CODEFORMER_COMMIT_HASH=""
#export BLIP_COMMIT_HASH=""

# Uncomment to enable accelerated launch
#export ACCELERATE="True"

# Uncomment to disable TCMalloc
#export NO_TCMALLOC="True"

###########################################
export http_proxy=http://10.50.26.95:8118
export https_proxy=http://10.50.26.95:8118

export no_proxy=localhost

# # Try using TCMalloc on Linux
# prepare_tcmalloc() {
#     if [[ "${OSTYPE}" == "linux"* ]] && [[ -z "${NO_TCMALLOC}" ]] && [[ -z "${LD_PRELOAD}" ]]; then
#         TCMALLOC="$(PATH=/usr/sbin:$PATH ldconfig -p | grep -Po "libtcmalloc(_minimal|)\.so\.\d" | head -n 1)"
#         if [[ ! -z "${TCMALLOC}" ]]; then
#             echo "Using TCMalloc: ${TCMALLOC}"
#             export LD_PRELOAD="${TCMALLOC}"
#         else
#             printf "\e[1m\e[31mCannot locate TCMalloc (improves CPU memory usage)\e[0m\n"
#         fi
#     fi
# }

# KEEP_GOING=1
# export SD_WEBUI_RESTART=tmp/restart
# while [[ "$KEEP_GOING" -eq "1" ]]; do
#     if [[ ! -z "${ACCELERATE}" ]] && [ ${ACCELERATE}="True" ] && [ -x "$(command -v accelerate)" ]; then
#         printf "\n%s\n" "${delimiter}"
#         printf "Accelerating launch.py..."
#         printf "\n%s\n" "${delimiter}"
#         prepare_tcmalloc
#         accelerate launch --num_cpu_threads_per_process=6 "${LAUNCH_SCRIPT}" "$@"
#     else
#         printf "\n%s\n" "${delimiter}"
#         printf "Launching launch.py..."
#         printf "\n%s\n" "${delimiter}"
#         prepare_tcmalloc
#         "${python_cmd}" "${LAUNCH_SCRIPT}" "$@"
#     fi

#     if [[ ! -f tmp/restart ]]; then
#         KEEP_GOING=0
#     fi
# done


# if use acclerate
accelerate launch --num_processes=1 --num_cpu_threads_per_process=1  launch.py --listen  --port 9092 --enable-insecure-extension-access
 
# else use 
#python3 launch.py --listen  --port 9092 --enable-insecure-extension-access
