# Kindle-Ducky

# A USB Rubber Ducky script and shell script to automate mass Kindle Fire (gen5) installations.

Automating mass Android devices is a pain in the neck, and likely is a nuisance for lot of organizations. There 
is no straightfoward way to do it without root, other than flashing an update.zip from recovery, which isn't always possible. Kindle ducky solves that problem (with Kindle Fire's anyway) by

* utilizing a USB Rubber Ducky to deal with the installation proceedure 
* add WiFi networks to the system, 
* Finally, enables USB Debugging so that the shell script can take over from there and install desired APK's. 

I wrote this program to ease the configuration of a bunch of Kindles I had to configure for a job. (I wish I had a ducky around when I had to install Ubuntu on ~100 computers.)

# Dependencies
* ADB (android-tools-adb)
* <a href="https://github.com/hak5darren/USB-Rubber-Ducky/wiki/Downloads">Duckencoder</a>
* Java Runtime (If you have <a href="https://code.google.com/p/simple-ducky-payload-generator"> simple-ducky</a> installed you already have the correct JRE)
* A  <a href="http://usbrubberducky.com/#!index.md"> USB Rubber Ducky</a>
* A Linux box of any flavor.

# USAGE

* Edit the script to suit your needs (wifi passwords, etc)
* Compile it & flash ducky (java -jar duckencode -i kindleducky -o /media/sd/inject.bin) 
* Turn on Kindle (this was all done on a Gen 5)
* Insert Ducky
* Wait for it run its course
* Unplug ducky and plug Kindle into your computer
* Run shell script to install APKs, record S/N, enter optional organization s/n, and record MAC address.
* Everything is saved to a log file


# Future Development

There is a lot of room for improvement here, no doubt. The shell script could be used with any version of Android, as  all it does is loop through some ADB commands and set everything up for. It is possible the ducky script may work on  Android devices other than the Kindle, but I have not tested that, and generally speaking, ducky scripts are very specific to particular versions of software. At some point, I plan on putting together a script that will do the same thing across as many devices as possible.
