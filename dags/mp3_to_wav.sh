#!/bin/bash

MP3_DIR=${1}
WAV_DIR=${2}

TARGET_SR=44100

mkdir -p ${WAV_DIR}

for mp3_path in ${MP3_DIR}/*.mp3 ; do
    fname=$( basename ${mp3_path} .mp3 )
    wav_path="${WAV_DIR}/${fname}.wav"
    sox -D ${mp3_path} ${wav_path} rate -v ${TARGET_SR}
done
