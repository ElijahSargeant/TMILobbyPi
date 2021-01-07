#!bin/bash

#find all files (better ls imo)
files=(./media/*)

#empty arrays that hold videos
vids=()


for file in ${files[*]}; do
	#returns file extension (mp4)
	ext="${file##*.}"

	#Sort filepaths into new array
	if [ $ext == 'mp4' ]; then

		vids=("${vids[*]}" "${file#.*/}")
		echo "added ${file} to vids"
	else
		echo "ignoring ${file}"
	fi
done

$vids

#play videos in the new array
for video in ${vids[*]}; do

	omxplayer "${video}" || true
	echo "${video}"

done