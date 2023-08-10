#!/bin/bash
export DISPLAY=""
export PYTHONPATH=.
if [ "${1}" != "" ]; then
    CUDA_VISIBLE_DEVICES=0 bash scripts/easy_train_postnet.bash &
    CUDA_VISIBLE_DEVICES=1 bash scripts/easy_train_nerf.bash &
    wait
else
    bash scripts/easy_train_postnet.bash || exit 1
    bash scripts/easy_train_nerf.bash || exit 1
fi