#!/bin/bash

sox raw_data/spk01/m_audio.wav -r 16000 -c 1 -b 16 raw_data/spk01/m_audio_conv.wav
./uber_single.sh . raw_data/spk01/ m_audio_conv.wav output/spk01 m_audio spk01 > spk01_m_audio.log 2>&1
