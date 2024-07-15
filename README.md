# MiSTerSindenDriver

This repository contains all the necessary files to enable the Sinden Lightgun functionality on the MiSTer platform.

This guide is intended for individuals with technical expertise until we refine the details and provide more comprehensive scripts, documentation, and additional resources.

## What is the Sinden Lightgun?

The Sinden Lightgun is a lightgun controller compatible with modern LCD displays. Unlike other lightguns, the Sinden Lightgun works by processing the data from a video camera onboard the gun. This allows it to work without needing to attach any external IR emitters or other devices to your display. However, processing the camera data into a gun tracking position requires specialized software and a good amount of processing power.

It is well known that the Sinden Lightgun performs its video crunching on the target computer device. This initially looked like it would not be possible to run on the MiSTer as the onboard ARM CPU (800Mhz) is quite underpowered and the Linux operating system is barebones. However, I have spent a lot of time developing a low-resource driver that can comfortably run on the MiSTer and also removed many required components so it can run on the streamlined Linux OS.

## The MiSTer Sinden Driver

The driver offers three modes: low resource, medium resource, and normal. When running in low resource mode, the driver only processes video when the trigger is pulled, resulting in high efficiency with only 4% CPU core usage. This mode works well for most 16-bit and under games that have a slow screen flash. Even games like T2 on the Genesis, which require continuous cursor movement, can be played by simply holding down the trigger.

For slightly better lightgun performance, the default (medium resource) mode continuously crunches video, providing ready coordinates when the trigger is pulled. This mode has a larger footprint but still doesn't interfere with MiSTer processing. It doesn't crunch every video frame to save resources.

Running the driver without the low resource and medium resource flags is considered normal mode, which consumes more resources than medium, and is generally fine but may potentially affect games like PSX that also rely on the ARM CPU.

I recommend starting with medium resource (default) mode, but you can switch to low resource if needed. Overclocking may improve performance, but it is not required and hasn't been tested yet.

Expect further improvements to the driver in the future.

## Prerequisites

> **Note:** For reference my setup is a MiSTer Multisystem games console as seen here: [MiSTer Multisystem games console](https://www.rmcretro.com/videos/a-very-first-look-at-the-mister-multisystem-games-console-vDIz8WY6zLE).

Having a joypad and a keyboard connected to your MiSTer is recommended during the configuration process, as well as the Sinden Lightgun.

Your Sinden Lightgun needs v1.09 firmware. To update the firmware or check the current firmware version, follow these steps:

1. On Windows, download the latest Windows software from www.sindenlightgun.com.
1. Connect your lightgun to your PC.
1. Open the Sinden software.
1. The Sinden software will try to autodetect your lightgun on load; when it has finished, click "stop".
1. Go to the firmware update tab.
1. Select your lightgun from the list on the left.
1. Update the Lightgun with the latest firmware.
1. Restart the Sinden software.
1. Select the lightgun on the firmware update tab.
1. Select "enable joystick mode" and click OK on the prompts.
1. Disconnect the Sinden from the PC and connect it back to the MiSTer.

Your MiSTer needs to be connected to the internet; with ethernet, it is the simplest way.

We recommend using a fresh SD card.

This guide assumes the user has set up a MiSTer before and can get MiSTer working. If you haven't done this yet, we recommend using MrFusion and following some guides to get a general idea of how everything works before following this guide.

## Installation

The following configuration has been tested and confirmed to work:

1. Install MiSTer using [MrFusion 2.7](https://github.com/MiSTer-devel/mr-fusion/releases/tag/v2.7). Any version should work, but 2.7 has been tested.
1. Update your MiSTer to the latest version. If using MrFusion:
   - Go to Scripts on the main menu and select "Update". This will add all the cores you need for non-lightgun gaming and includes the folders to put your ROMs. This can take a while (around 10 mins). Once the process is complete, reboot your MiSTer.
1. Find out your MiSTer IP address (Available on the main settings menu) and note it down.
1. Connect to the MiSTer device over SSH (Using putty or your SSH client of choice) or, if you have a keyboard connected to the MiSTer, you can load the console on the device by pressing F9 on the keyboard.
1. The username is `root` and the password is `1` on MiSTer mainline.
1. Download the `Install_SindenLightgunDriver.sh` script directly to your MiSTer using `wget`:

   ```shell
   wget https://raw.githubusercontent.com/MrLightgun/MiSTerSindenDriver/main/Install_SindenLightgunDriver.sh
   ```

1. From the MiSTer main menu, go to Scripts and select `Install_SindenLightgunDriver.sh`. This will execute the script and install the necessary files.

1. Reboot MiSTer after the script has successfully completed.

## Updating to the Latest Version

To update your existing MiSTerSindenDriver setup to the latest version, follow these steps:

1. Ensure your MiSTer is connected to the internet.
1. From the MiSTer main menu, go to `Scripts`.
1. Navigate to `/media/fat/Scripts/Sinden/MiSTerSindenDriver-main`.
1. Select `Install_SindenLightgunDriver.sh` and execute it. This script will download the latest files and re-run the installation, ensuring your setup is up-to-date.
1. Reboot MiSTer after the script has successfully completed.

## Uninstallation

To remove the Sinden Lightgun driver and associated files from your MiSTer setup, follow these steps:

1. Ensure your MiSTer is powered on and connected to the internet.
1. From the MiSTer main menu, go to `Scripts`.
1. Navigate to `/media/fat/Scripts/Sinden/MiSTerSindenDriver-main`.
1. Select `Uninstall_SindenLightgunDriver.sh` and execute it.
1. Reboot MiSTer after the script has successfully completed.

## Usage

There are multiple steps for getting lightguns to work in MiSTer, make sure to follow the steps in order:

### 1. Run the lightgun driver

Go to scripts on the MiSTer main menu, navigate to `/media/fat/Scripts` and select `SindenLightgunStart_Default.sh`. Click a button on your gamepad after it has started up.

Or, if you prefer to run it manually from the shell console, use the following commands:

- For medium resource:

   ```shell
   /media/fat/Scripts/SindenLightgunStart_Default.sh
   ```

- For low resource:

   ```shell
   /media/fat/Scripts/SindenLightgunStart_LowResource.sh
   ```

- For max resource:

   ```shell
   /media/fat/Scripts/SindenLightgunStart_MaxResource.sh
   ```

### 2. Setup lightgun as a MiSTer menu device

Setting up the lightgun as a MiSTer menu device enables the cores to see it.

> **Important** : THIS STEP IS NOW HANDLED BY THE SETUP SCRIPT, THESE NOTES ARE HERE FOR REFERENCE

1. Scroll through MiSTer settings, using your gamepad access System Settings -> Define joystick buttons.
1. When it prompts for the `DPAD Test: Press Right`, push right on Sinden Lightgun directional pad.
1. Press the space bar on the keyboard to skip all the tilt settings.
1. Assign Right/Left/Down/Up to Lightgun dpad.
1. Use the keyboard space bar to skip A, B, X, Y, L, R, Select.
1. Assign Start to the front left button.
1. Skip mouse-related prompts with the spacebar.
1. Assign the Menu action to Pump Action or a different button of your choice.
1. Assign Menu OK to the front right button on the lightgun.
1. Assign Menu Back to the back right button on the lightgun.
1. Skip others with the spacebar.

Important: Don't wave the lightgun around while doing the above, as the movement of the lightgun can be assigned as actions.

You can now navigate the menus using the lightgun alone.

### 3. Test the lightgun in a core

1. Add NES Duck Hunt to your MiSTer.
1. Load the `NES_Sinden` core

    >**Important**: The MiSTer loads the first joystick used in a core as Player1. When you first load a core, make sure to use the dpad on the lightgun first. If you use your gamepad first, then the lightgun will become player 2, which can cause problems. For example, the settings don't save correctly in the NES core and in PS1 you can't play Time Crisis because it wants a Player1 lightgun, but Player1 is assigned to the gamepad.

1. Load Duck Hunt in the core.

1. **Optional if you want to change your buttons. Initial configuration is handled by the script:**  Open the MiSTer menu; under System, find `Define NES buttons`, assign these buttons to the lightgun: A to front left, B to back left, Select to back right, Start to front right. Use the spacebar to skip the rest. Assign the Zapper/Vaus Btn to the lightgun trigger while pointing at the screen, you may need to trigger twice if you have just loaded the driver. Use space bar to skip the rest. Answer No to the question, then "Save Settings."

1. Optional, change the core-specific lightgun settings:

In the NES do Input Options:

- Peripheral: Change to Zapper(Joy1) or maybe Zapper(Joy2) if the other doesn't work, might depend on USB order of joypad (if you have) and lightgun.
- Zapper Trigger: Change to Joystick. Remember to use the lightgun dpad as soon as you load the core so it gets assigned to Player 1.
- Turn the Crosshair on or off.

>**Tip:** If your border is not showing clearly because the edges are cut off, change the video settings in the core. It probably changes depending on your resolution and display, but I find setting scale to "Wider HV-Integer" helps in most cases. Having black around the outside of the white border helps lightgun performance anyway.

>**Tip:** I find if the lightgun is not the Player1 joystick, the part where you do "Define NES buttons" doesn't save for me when I reload the core.

Duck hunt should now be working with the Sinden Lightgun.

## Supported Cores

So far these are the working cores with a couple of highlights:

| Core                | Game                                    |
|---------------------|-----------------------------------------|
| NES_Sinden          | Duck Hunt                               |
| PSX_Sinden          | Time Crisis, Point Blank                |
| Genesis_Sinden      | Terminator 2 The Arcade Game            |
| SNES_Sinden         | Battle Clash                            |
| MegaCD_Sinden*      | Mad Dog McCree                          |
| MegaDrive_Sinden*   | Terminator 2 The Arcade Game            |
| SMS_Sinden**        | Gangster Town                           |
| Atari7800_Sinden**  | Alien Brigade?, Crossbow?               |
| InputTest_Sinden    | Testing                                 |

* Core just added, more testing required.
** Built Core not added yet but in progress.

### NES_Sinden

https://github.com/MrLightgun/NES_MiSTer

NES settings are detailed further up in the guide as NES is used as the example core.

### PSX_Sinden

https://github.com/MrLightgun/PSX_MiSTer

>**Note:** Some of these steps have been done by the setup script.

Remember to use the lightgun dpad when you first load the core.

The PSX is a slightly more demanding core, and when reading sounds and video of the CD, you can see slowdown if the lightgun driver is using too many resources, so I recommend running the driver with the `medium resource` option for most scenarios. If you don't see any slowdown, then you can try the `low resource` option.

- Set Player1 to Guncon or Justifier depending on what the original lightgun support was.
- Define the buttons using the lightgun. The input ones are "Gun shoot," which needs to be the trigger, "Gun B" which is good for the rear left side button, and "Gun A" as the front left side button. I don't think the others are required.

If you tweak the "Fixed HBlank" setting, then you can normally get the game window to perfectly match the white border, which helps accuracy.

I've only noticed this in Point Blank 2, but on the menu, there is a bit where you shoot the arcade option. The game actually shoots where the gun last was; basically, the game is updating the lightgun position all the time on this screen. So if using the low resource driver, you shoot arcade, the bullet shows on arcade, but it selects the center option instead where the gun was located on the previous shot. To avoid this, when it is loading the screen, hold the trigger, and when the options appear, you can point towards arcade and it will highlight, then you can shoot it. After writing this, I have a hazy memory that something similar might happen in Area51, but not sure as my ROM is not currently working on the MiSTer.

#### 2 Players

The 2nd player does work. When you load the PSX core, remember to do dpad on Lightgun1, then dpad on Lightgun2. Point Blank is a good game for testing 2 Player. You need to set Player1 and Player2 to GunCon. If you add a new lightgun, probably best to do a hard reboot. You also need to define buttons for the 2nd Lightgun. As 2 players use more resources and Point Blank does a lot of reading off the CD, this is probably a good example where you need to use the low resource lightgun driver option.

>**Tip:** Remember to add a PS1 BIOS for the PS1 core.

### Genesis_Sinden

https://github.com/MrLightgun/Genesis_MiSTer

>**Note:** Some of these steps have been done by the setup script.

I found I could only get Terminator 2 to work when I also had a joypad connected to the MiSTer.

Make sure to use the lightgun dpad when you first load the core, then use the gamepad dpad so it becomes Player2, which seems to be required.

When assigning lightgun controls to the core, A button is a trigger, so assign A to the trigger. B and C to the left side buttons and Start and Select to the right side buttons. The rest of the buttons do not seem to be used.

On the input settings, set:

- Swap Joysticks: Yes
- Gun Control: Joy1
- Gun Fire: Joy
- Cross: Small but remember to turn off once everything is set up.

### MegaDrive_Sinden

https://github.com/MrLightgun/MegaDrive_MiSTer

Core with Sinden border just added, initial testing seems to show the crosshair doesn't match game aiming as accurately as the Genesis_Sinden core. Maybe MiSTer lightgun calibration option will fix this? Core supports Mastersystem, although haven't proven lightgun to work with this yet.

Settings are likely to be:

- Make sure to use the lightgun dpad when you first load the core, then use the gamepad dpad so it becomes Player2, which seems to be required.
- When assigning lightgun controls to the core, A button is a trigger, so assign A to the trigger. B and C to the left side buttons and Start and Select to the right side buttons. The rest of the buttons do not seem to be used.
- On the input settings, set:
  - Swap Joysticks: Yes
  - Gun Control: Joy1
  - Gun Fire: Joy
  - Cross: Small but remember to turn off once everything is set up.

### MegaCD_Sinden

https://github.com/MrLightgun/MegaCD_MiSTer

Core with Sinden border just added, now working with the updated MiSTer binary.

Mad Dog McCree working, Justifier works so much better than Menacer.

Settings are likely to be:

- Make sure to use the lightgun dpad when you first load the core, then use the gamepad dpad so it becomes Player2, which seems to be required.
- When assigning lightgun controls to the core, A button is a trigger, so assign A to the trigger. B and C to the left side buttons and Start and Select to the right side buttons. The rest of the buttons do not seem to be used.
- On the input settings, set:
  - Swap Joysticks: Yes
  - Gun Control: Joy1
  - Gun Fire: Joy
  - Cross: Small but remember to turn off once everything is set up.

### SNES_Sinden

https://github.com/MrLightgun/SNES_MiSTer

>**Note:** Some of these steps have been done by the setup script.

Same as all the above, remember there was Superscope and Justifier too. Remember to assign turbo to the lightgun properly as a lot of games need it. Some games like Terminator 2 have a superscope button as a trigger for some strange reason, so you may want to switch it, but I prefer the Genesis version anyway.

On the input settings, set:

- Swap Joysticks: No
- Super Scope: Joy1
- Super Scope Btn: Joy
- Gun Type: Super Scope (or justifier, as required)

### SMS_Sinden

https://github.com/MrLightgun/SMS_MiSTer

Input:

- Swap Joysticks: No
- Gun Control: Joy1
- Gun Port: Port1

### Atari7800_Sinden

https://github.com/MrLightgun/Atari7800_MiSTer

Peripherals:

- Swap Joysticks: No
- Port1 Input: Lightgun
- Gun Control: Joy1
- Gun Fire: Joy

### InputTest_Sinden

https://github.com/MrLightgun/InputTest_MiSTer

Source code not built and tested, but the existing built core is confirmed to work.

## Other Cores and Future Development

To come, hopefully:

- Saturn core - I think this still requires lightgun support to be added plus a border
- Other cores, maybe some of the computer cores; hopefully a future 3DO core would be good

## Updating an Existing Build

There will be some scripts to assist with updating a current build coming soon.

## Lightgun Settings and Recoil

Recoil should work by holding down "up" on the Dpad for 5 seconds. This should toggle between Off/Single Shot/Automatic. To change Sinden Lightgun settings, you can run:

```bash
nano /media/fat/Scripts/Sinden/MiSTerSindenDriver-main/LightgunDriver/LightgunMono.exe.config
```

To save: ctrl+o
To exit: ctrl+x

Recommend beginners only changing lightgun camera exposure, brightness, and contrast.

## Known Issues

Custom kernel had an issue with some (or all) wifi/BT adapters, fixed kernel added 5th July 2024.

## Special Thanks

This project to add Sinden Lightgun support owes a huge debt of gratitude to Nolan Nicholson, who assisted with the development and setup, and Wiggy from the Sinden Lightgun Discord, who helped push to make it happen and assisted with the scripts and testing.

## Note

If any script fails to be executable, check that the execution permission is set and perform a `chmod +x` on it if needed.
