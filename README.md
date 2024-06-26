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

Your Sinden Lightgun needs v1.09 firmware, on Windows, download the latest windows software from www.sindenlightgun.com
The latest Sinden software will try to autodetect your lightgun on load, when it has finished click "stop".
Go to firmware update tab
Update Lightgun with latest firmware.
Restart Sinden software
Select lightgun on firmware update tab
Click enable joystick mode and click ok to the prompts.
Disconnect

Recommend using a fresh SD card, the installation should improve over time but at the moment
it has been proven to work on these 2 builds:

Install MiSTer using MrFusion 2.7 
https://github.com/MiSTer-devel/mr-fusion
Use this version:
https://github.com/MiSTer-devel/mr-fusion/releases/tag/v2.7

or use MOnSieurFPGA Feb 2022 release
https://github.com/MOnSieurFPGA/MOnSieurFPGA-SD_Image_Builds

I am going to assume user has set up a MiSTer before and can get MiSTer working, if you haven't done this, I recommend using MrFusion and following some guides and just getting a general idea how everything works before following this guide.

Your MiSTer needs to be connected to the internet, with ethernet it is the simplest way.

If using MrFusion, Go to Scripts on the main menu and do "Update".  This will add all the cores you need for non-lightgun gaming and includes the folders to put your roms.

Find out your MiSTer IP address and note it down.

Connect to MiSTer device over ssh (I like to use putty), or you can load console on the device which I believe is F9 (you need a kb). Username/Pass is root/1 on MiSTer mainline and alarm/alarm on MOnSieur.  You can either copy the files over or can manually paste the commands.

Before running, you need to kill the MiSTer service.  I recommend hitting F9 to exit MiSTer to the console, if you run "top" you will see the running applications.  Make a note of the process id for MiSTer, then exit top with ctrl-c.  Then run "sudo kill xxxx" where xxxx is the process id.  Run this just before you run the Install scripts.

If installing MiSTer using MrFusion 2.7:
Run the Install_MrFusion.sh script from this github.

If installing using MOnSieurFPGA Feb 2022 release
Run the Install_MOnSieur.sh script from this github.

You can manually type it, or you can copy it onto MiSTer with ftp.  You need to run:
"chmod +x *.sh"
On the script so that the system can run it, and then run it like this "./Install_MrFusion.sh" or "./Install_MOnSieur.sh"

Reboot MiSTer after it has been successfully run.

There are multiple steps for getting lightguns to work in MiSTer, if you find the lightgun not working, just make sure you go through all these steps:
1) Run the lightgun driver.

Go to scripts on the MiSTer main menu, select "LightgunStart-Default" click a button on your gamepad after it has started up.

Or on the console you can manually do:
/media/fat/Lightgun/./LightgunDriver joystick

or (medium resource)
/media/fat/Lightgun/./LightgunDriver joystick mediumresource

or (low resource)
/media/fat/Lightgun/./LightgunDriver joystick lowresource

(On MOnSieur it would be /home/alarm/Lightgun/./LightgunDriver joystick )
Check all the startup messages that there is no errors.

2) Setup lightgun as a MiSTer menu device, this enables the cores to see it.
Scroll through MiSTer settings, go backwards on joypad to System Settings -> Define joystick buttons
When it says DPAD Test: Press Right, push right on Sinden Lightgun DPad
Press space bar on kb a couple of times to skip the tilt settings

Assign Right/Left/Down/Up to Lightgun dpad

Assign A + B to left side buttons

Use KB space bar to skip X,Y,L,R,Select

Start to front right button

Skip mouse ones with spacebar

Assign menu to back right button

Menu OK to pump action

Skip others

I don't think this order is essential so you can assign however helps you in the menus

4) Add NES duck hunt to MiSTer and load it in the NES_Sinden core.

5) Load MiSTer menu, under System, find Define NES buttons, assign these to the lightgun dpad:
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

6) Load core specific lightgun settings
In the NES do Input Options
Periphery change to Zapper(Joy1) or maybe Zapper(Joy2) if the other doesn't work, might depend on USB order of joypad (if you have) and lightgun
Zapper Trigger to Joystick
I find scrolling through Periphery tends to kick the lightgun into life, you should see the crosshair move when you exit the menu
You can turn the crosshair off but it is useful when learning and testing.

If your border is not showing, clearly because the edges are cut off, change the video settings in the core, it probably changes depending on your resolution and display but I find setting scale to "Wider HV-Integer" helps in most cases.  Having black around the outside of the white border helps lightgun performance anyway.

The part where you do "Define NES buttons" doesn't always save for me, I'm not sure what the trick is, sometimes on a build I restart and it keeps the settings perfectly, other times I have to redo it and it won't save.  Not sure what the trick is.

So far these are the working cores with a couple of highlights:
NES_Sinden - Duck Hunt

PSX_Sinden - Time Crisis, Point Blank

Genesis_Sinden - T2

SNES_Sinden - Battle Clash


PSX_Sinden
Remember to switch to Guncon or Justifier depending on what the original lightgun support was
Follow similar steps to the NES_Sinden core
2 Player may work, I have not yet tested, 2 lightguns is definitely working in the driver, you might need to not have a joypad connected for it to work.  Point Blank 2 is a good one for testing.
There is a display setting tweak on some monitors/resolution where the border matches super nicely with the outside of the game
Remember to add a BIOS.

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

Other cores, maybe some of the computer cores, hopefully a future 3DO core would be good

This project to add Sinden Lightgun support owes a huge debt of gratitude to Nolan Nicholson who assisted with the development and setup and Wiggy from the Sinden Lightgun Discord who help push to make it happen and assisted with the scripts and testing.

I've really tidied up the MrFusion version of this guide on 27th June 2024, need to do the same to the MOnSieur guide, so there may be issues with that.
 








