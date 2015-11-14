#!/bin/bash
# Adb install an apk, get OEM s/n, get macc address
# define variables
USAGE="Usage: $0 < --start >: Start ADB, check for and create files. < --run > Conect ADB, Install APK, get S/N, get MAC.  "
file=someapktoinstall.apk
cwd=$(pwd)
cwd=$workdir
so=$(adb get-serialno)
out=devices.log
org=CompanyName, INC
#



# prep env

if [[ $1 == "--configure" ]]; then
    if which programname >/dev/null; then
    	echo We have ADB, okay...
    else
    	echo 'This script needs ADB. Installing...'
    	sudo apt-get -y -qq install android-tools-adb
    fi

elif [[ $1 == "--start" ]];then


	if [[ ! -f $out ]];then
		touch $out
		echo
	fi

	cd $workdir
	adb start-server

# do it

elif [[ $1 == "--run" ]];then
# Ought to be looped, will fix soon...
#while true;do

	adb wait-for-device
	read -p "Enter $org Device Number: " device
	adb install $file.apk && echo SUCCESS
	echo "#########-BGN-##########" | tee -a $out
	echo  $org S/N: $device | tee -a $out
	echo OEM S/N:| tee -a $out 
	echo $so | tee -a $out
	echo MAC ADDRESS: | tee -a $out
	echo  $(adb shell netcfg | grep wlan0 | grep -o -E '([[:xdigit:]]{1,2}:){5}[[:xdigit:]]{1,2}')  | tee -a $out
	echo "#########-END-#########" | tee -a $out
	cp $out $out.back
#done

else

echo $USAGE

fi

exit
