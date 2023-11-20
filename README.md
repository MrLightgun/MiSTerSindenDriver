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

Before running, you need to kill the MiSTer service.  If you run "top" you will see the running applications.  Make a note of the process id for MiSTer, then exit top with ctrl-c.  Then run "sudo kill xxxx" where xxxx is the process id.  Run this just before you run the Install scripts.

Install MiSTer using MrFusion 2.7
Run the Install_MrFusion.sh script

Install using MOnSieurFPGA Feb 2022 release
Run the Install_MOnSieur.sh script

You can manually type it, or you can copy it onto MiSTer with ftp.  You need to run:
"chmod +x *.sh"
On the script so that the system can run it, and then run it like this "./Install_MrFusion.sh"








