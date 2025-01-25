#!/bin/sh
# main.command
# Comfy Launcher for Mac MLX hardware by Tristan John.
# By default, his script assumes your working conda environment is labeled 'comfyui'
# and your working folder is labeled 'ComfyUI'.
# You can make changes here to match your unique installation.

osascript -e 'tell app "Terminal" to do script "
sleep 2s &&
cd &&
conda deactivate &&
conda activate comfyui &&
cd ~/ComfyUI &&
PYTORCH_ENABLE_MPS_FALLBACK=1 python main.py &
sleep 3s &&
open http://127.0.0.1:8188 &&
srvpid=$! &&
funtion bye() {
    kill -15 $srvpid
    conda deactivate
    cd
    clear
    echo \"ComfyUI Session Terminated\"
    }"'
