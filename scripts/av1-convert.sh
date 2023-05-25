#!/bin/bash

# $1 needs to be in quotes if it contains spaces

if [ $2 = "icare" ]
then
	notify-send "Converting image to AV1 with CRF 19"
	ffmpeg -i "$1" -c:v libaom-av1 -cpu-used 8 -crf 19 "$1-av1-crf19.avif"
elif [ $2 = "idontcare" ]
then
	notify-send "Converting image to AV1 with CRF 27"
	ffmpeg -i "$1" -c:v libaom-av1 -cpu-used 8 -crf 27 "$1-av1-crf27.avif"
fi
notify-send "Done!"
