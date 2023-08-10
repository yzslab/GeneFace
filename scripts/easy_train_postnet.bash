#!/bin/bash
export DISPLAY=""
python tasks/run.py --config=egs/datasets/videos/${VIDEO_ID}/lm3d_postnet_sync.yaml --exp_name=${VIDEO_ID}/postnet || exit 1
