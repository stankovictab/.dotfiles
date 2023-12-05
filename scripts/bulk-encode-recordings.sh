for i in *.mp4 # NOTE: Change over to .mkv if need be
	do 
	echo "Processing: ${i%.*}" # ${i%.*} is the file name before the extension
	ffmpeg -hide_banner -i "$i" -c:v libx265 -preset medium -crf 28 -c:a copy "${i%.*}-x265crf28med.mkv"
	echo "Finished with: ${i%.*}"
done
