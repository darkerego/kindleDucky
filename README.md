# Kindle-Ducky

# A USB Rubber Ducky script and shell script to automate mass Kindle Fire (gen5) installations.

Automating mass Android devices is a pain in the neck, and likely is a nuisance for lot of organizations. There 
is no straightfoward way to do it without root, other than flashing an update.zip from recovery, which isn't always possible. The rubber ducky solves that problem. Kindle Ducky...

* utilizing a USB Rubber Ducky to deal with the installation proceedure 
* add WiFi networks to the system, 
* Finally, enables USB Debugging so that the shell script can take over from there and install desired APK's. 

# Dependencies
* ADB (android-tools-adb)
* Duckencoder (https://github.com/hak5darren/USB-Rubber-Ducky/wiki/Downloads)
* Java Runtime
* A USB Rubber Ducky!
* A Linux box

# USAGE

* Edit the script to suit your needs (wifi passwords, etc)
* Turn on Kindle (this was all done on a Gen 5)
* Insert Ducky
* Wait for it run its course
* Unplug ducky and plug Kindle into your computer
* Run shell script to install APKs, record S/N, enter optional organization s/n, and record MAC address.
* Everything is saved to a log file


# Future

There is a lot of room for improvement here, no doubt. But it works!
