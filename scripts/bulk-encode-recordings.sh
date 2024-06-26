for i in *.mp4 # NOTE: Change over to .mkv or .mp4 if need be
	do 
	echo "Processing: ${i%.*}" # ${i%.*} is the file name before the extension
	# ffmpeg -hide_banner -i "$i" -c:v libx265 -preset medium -crf 26 -c:a copy "${i%.*}-x265crf26med.mkv"
	ffmpeg -hide_banner -i "$i" -c:v libx264 -preset medium -crf 27 -c:a aac "${i%.*}-x264crf27med.mp4"
	echo "Finished with: ${i%.*}"
done
