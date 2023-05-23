#!/bin/bash

if [ $2 = "icare" ]
then
	notify-send "Converting image to AV1 with CRF 21"
	ffmpeg -i "$1" -c:v libaom-av1 -cpu-used 8 -crf 21 "$1-av1-crf21.avif"
elif [ $2 = "idontcare" ]
then
	notify-send "Converting image to AV1 with CRF 27"
	ffmpeg -i "$1" -c:v libaom-av1 -cpu-used 8 -crf 27 "$1-av1-crf27.avif"
fi
notify-send "Done!"
