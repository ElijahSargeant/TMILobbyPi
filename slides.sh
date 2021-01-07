#!bin/bash

xset s noblank
xset s off
xset -dpms

echo set xsets

#unclutter -root &

#sed -i 's/"exited_cleanly":false/"exited_cleanly":true/' /home/pi/.config/chromium/Default/Preferences
#sed -i 's/"exit_type":"Crashed"/"exit_type":"Normal"/' /home/pi/.config/chromium/Default/Preferences

echo trying to open images...

#find all files (better ls imo)
#files="$(find /photos_videos/ -name '*.jpg' -o -name '*.png' )"

#empty arrays that hold images and videos
#imgs=(*)


#for file in ${files[*]}; do
	#returns file extension (jpg)
	#ext="${file##*.}"

	#sort filepaths into new array
	#if [ $ext == 'jpg' ]; then

	#	imgs=("${imgs[*]}" "file:///home/pi/Desktop/TrimationLobbyProject/photos_videos/${file}")
	#	echo "added ${file} to img"
	#else 
	#	echo "ignoring ${file}"
	#fi
#done

#open the images into chrome
#chromium-browser --noerrordialogs --disable-infobars --kiosk ${imgs[*]}
eog media/*.jpg -fs