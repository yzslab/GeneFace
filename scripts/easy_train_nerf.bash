#!/bin/bash
set -x
export DISPLAY=""
python tasks/run.py --config=egs/datasets/videos/${VIDEO_ID}/lm3d_radnerf.yaml --exp_name=${VIDEO_ID}/lm3d_radnerf || exit 1
python tasks/run.py --config=egs/datasets/videos/${VIDEO_ID}/lm3d_radnerf_torso.yaml --exp_name=${VIDEO_ID}/lm3d_radnerf_torso || exit 1
