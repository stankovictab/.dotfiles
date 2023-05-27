for i in *.mkv 
	do 
	echo "Processing: ${i%.*}" # ${i%.*} is the file name before the extension
	ffmpeg -hide_banner -i "$i" -c:v libx264 -preset medium -crf 24 -c:a aac -ac 6 -c:s mov_text "${i%.*}.mp4"
	echo "Finished with: ${i%.*}"
done
