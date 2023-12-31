# MiSTerSindenDriver
A repo to for all the files needed to get Sinden Lightgun to work on MiSTer

The Sinden Lightgun is a lightgun controller compatible with modern LCD displays. Unlike other lightguns, the Sinden Lightgun works by processing the data from a video camera onboard the gun. This allows it to work without needing to attach any external IR emitters or other devices to your display. However, processing the camera data into a gun tracking position requires specialized software and a good amount of processing power.

It is well known that the Sinden Lightgun performs it's video crunching on the target computer device.  This initially looked like it would not be possible to run on the MiSTer as the onboard ARM cpu (800Mhz) is quite underpowered and the Linux operating system is barebones.  However I have spent a lot of time developing a low resource driver that can comfortably run on the MiSTer and also removed many required components so it can run on the streamlined Linux OS.

The installation quite easy and will hopefully become easier in the future.

The driver has 3 modes, low resource, medium resource and normal.  If you run with the lowresource flag then it will only process video when you pull the trigger.  This makes it very efficient and the driver only takes up 4% of a cpu core.  The performance is acceptable, most 16bit and under games have a slow screen flash so the lightgun plays nicely.  Even games like T2 on the Genesis that need a continuous cursor you can just hold the trigger down.

If you want a bit more lightgun performance then run mediumresource, this continually crunches video and therefore has a bigger footprint and still doesn't seem to interfere with the MiSTer processing.  The lightgun performance is therefore better and the coordinates will be ready when you pull the trigger instead of generating it afterwards.  To save resources it doesn't crunch every video frame.

If you run without the lowresource and mediumresource flag then it just runs normally which still runs OK but theoretically things like PSX that also need to hit the ARM CPU could be affected.

The default mode for MiSTer should be lowresource and in discussions and any trouble shooting I will assume this is what is being used.  Having the very small resource footprint is a key part of the MiSTer Sinden Lightgun support. 

Overclocking will most likely improve performance but is not required and I haven't actually tested it either.

There will be further improvements with the driver in the future.

This guide is recommended for technical people only till we thrash some of the details out
and create more helpful scripts, docs and other resources.

For reference my setup is a MiSTer Multisystem games console as seen here:

https://www.rmcretro.com/videos/a-very-first-look-at-the-mister-multisystem-games-console-vDIz8WY6zLE

I have a generic joypad connected and a keyboard, you can also have the Sinden Lightgun connected throughout the process.

Your Sinden Lightgun needs v1.09 firmware, on Windows download the windows v2.05 beta.
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
Run the Install_MrFusion.sh script from this github.

Install using MOnSieurFPGA Feb 2022 release
Run the Install_MOnSieur.sh script from this github.

You can manually type it, or you can copy it onto MiSTer with ftp.  You need to run:
"chmod +x *.sh"
On the script so that the system can run it, and then run it like this "./Install_MrFusion.sh" or "./Install_MOnSieur.sh"

There are multiple steps for getting lightguns to work in MiSTer, if you find the lightgun not working, just make sure you go through all these steps:
1) Run the lightgun driver, recommed manually running:

/media/fat/Lightgun/./LightgunDriver joystick lowresource

or (medium resource)

/media/fat/Lightgun/./LightgunDriver joystick mediumresource

or (full resource)

/media/fat/Lightgun/./LightgunDriver joystick

but you can also run it from the scripts menu on the MiSTer (currently not working on the MrFusion build).
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

This project to add Sinden Lightgun support owes a huge debt of gratitude to Nolan Nicholson who assisted with the development and setup and Wiggy from the Sinden Lightgun Discord who help push to make it happen and assisted with the scripts and testing.

 








