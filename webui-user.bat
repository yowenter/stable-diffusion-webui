@echo off

set PYTHON=.\venv\Scripts\python.exe
set GIT=
set VENV_DIR=venv
set COMMANDLINE_ARGS=--medvram --autolaunch --deepdanbooru --xformers --no-half  --listen  --port 9092 --enable-insecure-extension-access --api

call webui.bat
