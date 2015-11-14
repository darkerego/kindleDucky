# Kindle-Ducky

# A USB Rubber Ducky script and shell script to automate mass Kindle Fire (gen5) installations.

Automating mass Android devices is a pain in the neck, and likely is a nuisance for lot of organizations. There 
is no straightfoward way to do it without root, other than flashing an update.zip from recovery, which isn't always possible. Kindle ducky solves that problem (with Kindle Fire's anyway) by

* utilizing a USB Rubber Ducky to deal with the installation proceedure 
* add WiFi networks to the system, 
* Finally, enables USB Debugging so that the shell script can take over from there and install desired APK's. 

# Dependencies
* ADB (android-tools-adb)
* <a href="https://github.com/hak5darren/USB-Rubber-Ducky/wiki/Downloads">Duckencoder</a>
* Java Runtime (If you have <a href="https://code.google.com/p/simple-ducky-payload-generator"> simple-ducky</a> installed you already have the correct JRE)
* A  <a href="http://usbrubberducky.com/#!index.md" USB Rubber Ducky</a>>
* A Linux box of any flavor

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
