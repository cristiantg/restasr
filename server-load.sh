#!/bin/bash

# Make sure your audio file is correctly encoded:
#sox . source/henk/henk.wav -r 16000 -c 1 -b 16 raw_data/henk/henk_conv.wav
./uber_single.sh . raw_data/henk henk.wav output/henk henk speaker > logfile 2>&1