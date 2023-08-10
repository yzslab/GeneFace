#!/bin/bash
for i in VIDEO_ID WAV_ID POSTNET_STEP; do
    if [ "${!i}" == "" ];then
        echo "${i} is required"
        exit 1
    fi
done

export PYTHONPATH=.
export Video_ID=${VIDEO_ID}
export Wav_ID=${WAV_ID}
export Postnet_Ckpt_Steps=${POSTNET_STEP} # please reach to `docs/train_models.md` to get some tips about how to select an approprate ckpt_steps!

python inference/postnet/postnet_infer.py \
    --config=checkpoints/${Video_ID}/postnet/config.yaml \
    --hparams=infer_audio_source_name=data/raw/val_wavs/${Wav_ID}.wav,${1}\
infer_out_npy_name=infer_out/${Video_ID}/pred_lm3d/${Wav_ID}.npy,\
infer_ckpt_steps=${Postnet_Ckpt_Steps} \
    --reset

python utils/visualization/lm_visualizer.py \
    --npy_name infer_out/${Video_ID}/pred_lm3d/${Wav_ID}.npy \
    --audio_name data/raw/val_wavs/${Wav_ID}.wav \
    --out_path infer_out/${Video_ID}/visualized_lm3d/postnet_${POSTNET_STEP}-${Wav_ID}.mp4