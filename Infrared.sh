#!/bin/bash

#Simple set of bash scripts to automate playing videos and displaying a "slideshow"
#on a TV ran by a Raspberry Pi. Also allows a PIR Infrared sensor to control timing
#of videos and slides as well as power of the TV. 

#Elijah Sargeant 2020

#Better shutdown in case of big poop
shutdown()
{
    pkill -f "keyPress.sh"
    pkill -f "videos.sh"
    pkill -f "slides.sh"

    vcgencmd display_power 1
    
    echo " clean exit, other scripts shut down"
    exit 0
}

trap shutdown SIGINT


BASE_PATH=/sys/class/gpio

#Pin 14 for Infrared
INFRARED=14

#Export pin and assign as Input if needed
#echo $INFRARED > $BASE_PATH/export
#echo "in" > $BASE_PATH/gpio$INFRARED/direction

#Start slideshow

prev=1
curr=0

first=1

while [ 1 ] 
do

    #Get PIR sensor input
    curr=$(sudo cat $BASE_PATH/gpio$INFRARED/value)

    if [[ "$prev" != "$curr" && "$curr" == "1" ]]; then

        echo 'on' 
        bash slides.sh &

        pkill -f "blank.sh"

        #video cooldown to stop funky time, can be adjusted
        #                 /-------------------------/
        #                v
        if (( $SECONDS > 60 || $first == 1 )); then
            
            #Start playing videos
            source videos.sh &&

            #reset cooldown
            SECONDS=0

            first=0
        fi
    fi
    if [[ "$prev" != "$curr" && "$curr" == "0" ]]; then
        #Put up blank image
        bash blank.sh &
        echo 'off'
        pkill -f "slides.sh"
    fi

    prev=$curr
done