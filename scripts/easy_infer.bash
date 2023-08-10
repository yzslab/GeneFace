#!/bin/bash
set -x
export DISPLAY=""
export PYTHONPATH=.
echo "POSTNET_HPARAMS=${POSTNET_HPARAMS}"
echo "LM3D_HPARAMS=${LM3D_HPARAMS}"
bash scripts/easy_infer_postnet.sh "${POSTNET_HPARAMS}" || exit 1
bash scripts/easy_infer_lm3d_radnerf.sh "${LM3D_HPARAMS}" || exit 1