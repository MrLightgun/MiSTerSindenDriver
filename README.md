# MiSTerSindenDriver
A repo to for all the files needed to get Sinden Lightgun to work on MiSTer

This guide is recommended for technical people only till we thrash some of the details out
and create more helpful scripts, docs and other resources.

Your Sinden Lightgun needs v1.09 firmware, on windows download the windows v2.05 beta.
Update Lightgun with latest firmware.
Restart Sinden app
Select lightgun on firmware update tab
Click enable joystick mode and click ok to the prompts.
Disconnect

Recommend using a fresh SD card, the installation should improve over time but at the moment
it has been proven to work on these 2 builds:

Install MiSTer using MrFusion 2.7 
https://github.com/MiSTer-devel/mr-fusion

or use MOnSieurFPGA Feb 2022 release
https://github.com/MOnSieurFPGA/MOnSieurFPGA-SD_Image_Builds

I am going to assume user has set this up and can get MiSTer working.

Connect to MiSTer over ssh (I like to use putty), or you can load console on the device which I believe is F9 (you need a kb).

sudo mkdir Lightgun
cd Lightgun
wget https://github.com/MrLightgun/MiSTerSindenDriver/archive/refs/heads/main.zip
unzip main.zip
cd MiSTerSindenDriver-main
cd Cores

#copy custom cores that have Sinden border built in
sudo mkdir /media/fat/_Console/
sudo cp -p *.rbf /media/fat/_Console/
sudo chmod 755 /media/fat/_Console/*.rbf

#copy startup scripts to easily start and stop the lightgun
cd..
cd StartupScripts
sudo cp *.sh /MiSTer/scripts
chmod +x /MiSTer/scripts/*.sh

#copy lightgundriver
cd..
cd LightgunDriver
sudo cp *.* /home/alarm/Lightgun

#copy tweaked kernel
#just be careful with this, don't do it on your fancy MiSTer sdcard build you spent 2 years setting up and don't have a #backup
cd ..
cd Kernel\MOnSieurFPGA\28thFeb2022
MiSTerSindenDriver-main
sudo cp zImage_dtb 
sudo cp /boot/linux/zImage_dtb zImage_dtb_backup
sudo cp zImage_dtb /boot/linux/zImage_dtb

#now update MiSTer to be able to read the Sinden lightgun joystick
cd ..
cd ..
cd ..
cd MiSTerUpdate

sudo cp /usr/bin/MiSTer /usr/bin/MiSTer_orig
sudo cp /home/alarm/MiSTer_binary /usr/bin/MiSTer
sudo chmod u+x /usr/bin/MiSTer
sudo systemctl restart MiSTer






