#!/bin/sh

BLUR="2x8"

for OUTPUT in $(ls ~/Wallpapper/*.jpg)
do
	OUTFILE="$OUTPUT.blured.png"
	#echo $OUTFILE
	convert $OUTPUT -blur $BLUR $OUTFILE
done
