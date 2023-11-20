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

Connect to MiSTer device over ssh (I like to use putty), or you can load console on the device which I believe is F9 (you need a kb). Username/Pass is root/1 on MiSTer mainline and alarm/alarm on MOnSieur.

Before running, you need to kill the MiSTer service.  If you run "top" you will see the running applications.  Make a note of the process id for MiSTer, then exit top with ctrl-c.  Then run "sudo kill xxxx" where xxxx is the process id.  Run this just before you run the Install scripts.

Install MiSTer using MrFusion 2.7
Run the Install_MrFusion.sh script

Install using MOnSieurFPGA Feb 2022 release
Run the Install_MOnSieur.sh script

You can manually type it, or you can copy it onto MiSTer with ftp.  You need to run:
"chmod +x *.sh"
On the script so that the system can run it, and then run it like this "./Install_MrFusion.sh" or "./Install_MOnSieur.sh"

There are multiple steps for getting lightguns to work in MiSTer, if you find the lightgun not working, just make sure you go through all these steps:
1) Run the lightgun driver, recommed manually running:
/media/fat/Lightgun/./LightgunDriver joystick lowresource
but you can also run it from the scripts menu on the MiSTer
(On MOnSieur it would be /home/alarm/Lightgun/./LightgunDriver joystick lowresource)
Check all the startup messages that there is no errors.

2) Setup lightgun as a MiSTer menu device, this enables the cores to see it.
Scroll through MiSTer settings, go backwards on joypad to System Settings -> Define joystick buttons
When it says DPAD Test: Press Right, push right on Sinden Lightgun DPad
Press space bar on kb a couple of times to skip the tilt settings
Assign Right/Left/Down/Up to Lightgun dpad
Assign A + B to left side buttons
Use KB space bar to skip X,Y,L,R,Select
Start to front right
Skip mouse ones with spacebar
Assign menu to back right
Menu OK to pump action
Skip others
I don't think this order is essential so you can assign however helps you in the menus

3) Add NES duck hunt to MiSTer and load it in the NES_Sinden core.

4) Load MiSTer menu, under System, find Define NES buttons, assign these to the lightgun dpad:
right, left,down,up
A to front left
B to back left
Select to back right
Start to front right
Use spacebar to skip FDS, Mic
Assign Zapper/Vaus Btn to the lightgun trigger while pointing at the screen, you may need to trigger twice if you have just loaded the driver
Use space bar to skip the rest
Answer No to the question
Then "Save Settings"

5) Load core specific lightgun settings
In the NES do Input Options
Periphery change to Zapper(Joy1) or maybe Zapper(Joy2) if the other doesn't work, might depend on USB order of joypad (if you have) and lightgun
Zapper Trigger to Joystick
I find scrolling through Periphery tends to kick the lightgun into life, you should see the crosshair move when you exit the menu
You can turn the crosshair off but it is useful when learning and testing.


So far these are the working cores with a couple of highlights:
NES_Sinden - Duck Hunt
PSX_Sinden - Time Crisis, Point Blank
Genesis_Sinden - T2
SNES_Sinden - Battle Clash

PSX_Sinden
Remember to switch to Guncon or Justifier depending on what the original lightgun support was
Follow similar steps to the NES_Sinden core
2 Player may work, I have not yet tested, the driver supports 2 Sinden Lightguns
There is a display setting tweak where the border matches super nicely with the game

Genesis_Sinden
I found I could only get T2 to work, when I had a joypad also attached.
When assigning lightgun controls to the core, A button is a trigger, so assign A to the trigger.

SNES_Sinden
Same as the all the above, remember there was Superscope and Justifier too.
Remember to assign turbo to the lightgun properly as a lot of games need it
Some games like T2 have a superscope button as a trigger for some strange reason so you may want to switch it, but I prefer the Genesis version anyway.

To come hopefully:
Sega Master System core - just need to add the border
SegaCD core - just need to add the border
Saturn core - I think this still requires lightgun support to be added plus a border
Other cores, maybe some of the computer cores, hopefully a 3DO core would be good

Bugs, currently in testing I am having to run this after every reboot for lightgun driver to run:

export LD_LIBRARY_PATH+=$LD_LIBRARY_PATH:/media/fat/Lightgun
This is solved by adding 

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/media/fat/Lightgun to the end of /etc/profile

but this doesn't solve the scripts issue below.

Currently scripts are not working, you need to launch with the console and even if they were when running the scripts in the MiSTer menu, you have to press a button on a KB to exit.



 








