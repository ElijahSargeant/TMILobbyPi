#!/bin/bash

#For uploading pictures(JPG) and videos(MP4) to the lobby PI
#Elijah Sargeant 2020


try {
    #Open up psftp connection

    $FTPHost = ""
    $FTPUser = ""
    $FTPPass = ""
    $PSFTPPath = "S:\zRaspberryPi\psftp.exe"
    $cmd = @(

    #Delete all files in pi folder

    "del Desktop/TrimationLobbyProject/media/*.jpg"
    "bye"
    )


    $cmd | & $PSFTPPath -pw $FTPPass "$FTPUser@$FTPHost" -be

    #copy over new files in /media/ on network pi folder
    ./pscp.exe -P 22 -pw '' media/*.jpg  :Desktop/TrimationLobbyProject/media/


    Write-Host "PSCP successfully transfered files!" -Foregroundcolor Green
}

catch {
        
    Write-Host "Couldn't transfer files!" -ForegroundColor Red
}

$Any=Read-Host "Press any key to quit..."
