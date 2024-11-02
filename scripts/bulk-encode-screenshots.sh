# NOTE: Use fd . png to find all png files in current directory
for i in *.png
	do 
	echo "Processing: ${i%.*}" # ${i%.*} is the file name before the extension
	ffmpeg -hide_banner -i "$i" -c:v libjxl -effort 7 -distance 1 "${i%.*}-eff7dist1.jxl"
	echo "Finished with: ${i%.*}"
done
