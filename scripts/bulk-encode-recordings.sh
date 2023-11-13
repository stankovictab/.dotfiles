for i in *.mkv
	do 
	echo "Processing: ${i%.*}" # ${i%.*} is the file name before the extension
	ffmpeg -hide_banner -i "$i" -c:v libx265 -preset medium -crf 31 -c:a copy "${i%.*}-x265crf31med.mkv"
	echo "Finished with: ${i%.*}"
done
