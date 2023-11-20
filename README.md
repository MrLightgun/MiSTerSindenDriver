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

Connect to MiSTer device over ssh (I like to use putty), or you can load console on the device which I believe is F9 (you need a kb).

#Download Sinden files
sudo mkdir /home/alarm/Lightgun
cd /home/alarm/Lightgun
sudo wget https://github.com/MrLightgun/MiSTerSindenDriver/archive/refs/heads/main.zip
sudo unzip main.zip
cd /home/alarm/Lightgun/MiSTerSindenDriver-main
sudo chmod +x install.sh

./install.sh

sudo mkdir /media/fat/Lightgun
cd /media/fat/Lightgun
sudo wget https://github.com/MrLightgun/MiSTerSindenDriver/archive/refs/heads/main.zip
sudo unzip main.zip
cd /media/fat/Lightgun/MiSTerSindenDriver-main

./install2.sh





