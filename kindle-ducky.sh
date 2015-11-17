#!/bin/bash
# Adb install an apk, get OEM s/n, get macc address
# define variables
USAGE="Usage: $0 <option> [ [--configure][-c]] | [[--run] [-r]] | [[--kill] [-k]] ]"
file=app.apk
# Define a directory and maybe use a wildcard to install multiple apks
#cwd=$(pwd)
#cwd=$workdir
so=$(adb get-serialno)
out=devices.log
org="CompanyName, INC"
#

control_c() {
    echo "Cleaning up..."
    killall adb >> /dev/null
    echo "Goodbye!"
    exit
}




# prep env

configure(){
   
    echo "Will now check for adb and create log... Remember to define apk(s) to install in script, if any."
    if [[ ! -f $out ]];then
		touch $out
		echo $(date) >> $out
    fi
    
    if which adb >/dev/null; then
    	echo We have ADB, okay...
    else
    	echo 'This script needs ADB. Installing...'
    	sudo apt-get -y -qq install android-tools-adb
    fi
}


run(){
# Get org s/n, install apk(s), get oem s/n, mac address of wlan0, wait for next device
while true;do

	adb wait-for-device
	read -p "Enter $org Device Number: " device
	# I only needed to install one apk, it can be tweaked to install more
	adb install $file && echo SUCCESS
	echo "#########-BGN-##########" | tee -a $out
	echo  "$org S/N: $device" | tee -a $out
	echo "OEM S/N: "| tee -a $out 
	echo $so | tee -a $out
	echo "MAC ADDRESS:" | tee -a $out
	adb shell netcfg | grep wlan0 | grep -o -E '([[:xdigit:]]{1,2}:){5}[[:xdigit:]]{1,2}'  | tee -a $out
	echo "#########-END-#########" | tee -a $out
	cp $out $out.back
	read -p "All done. Unplug device and enter OK to wait for next device..." allGood
	if [[ $allGood == "OK" ]];then
		sleep 1
		echo
		echo "Waiting for next device..."
	fi
done
}

# script arguments

case "$1" in

--configure|-c)  echo "Checking for dependencies..."
	configure
    ;;
--run|-r)  echo  "Waiting for device..."
    	trap control_c SIGINT
    	run
    ;;
--kill|-k) echo  "Sending SIGKILL signal"
   	killall adb
   ;;
*) echo $USAGE
   	killall adb
   ;;
esac



exit
