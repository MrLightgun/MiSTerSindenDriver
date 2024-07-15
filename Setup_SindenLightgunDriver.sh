#!/bin/bash

# Copy custom cores that have Sinden border built in
cd /media/fat/Scripts/Sinden/MiSTerSindenDriver-main/Cores
sudo mkdir -p /media/fat/_Console/
sudo cp -f *.rbf /media/fat/_Console/
sudo chmod 755 /media/fat/_Console/*.rbf

# Copy startup scripts to easily start and stop the lightgun
cd /media/fat/Scripts/Sinden/MiSTerSindenDriver-main/StartupScripts
sudo cp -f *.sh /media/fat/Scripts

# Copy lightgun driver
cd /media/fat/Scripts/Sinden/MiSTerSindenDriver-main/LightgunDriver
sudo mkdir -p /media/fat/SindenLightgun
sudo cp -f *.* /media/fat/SindenLightgun/
sudo cp -f LightgunDriver /media/fat/SindenLightgun/LightgunDriver

# Copy tweaked kernel
cd /media/fat/Scripts/Sinden/MiSTerSindenDriver-main/Kernel/MiSTerFPGA/MrFusion2.7/
sudo cp -f /media/fat/linux/zImage_dtb /media/fat/linux/zImage_dtb_backup
sudo cp -f zImage_dtb /media/fat/linux/zImage_dtb

# Now update MiSTer to be able to read the Sinden lightgun joystick
cd /media/fat/Scripts/Sinden/MiSTerSindenDriver-main/MiSTerUpdate
sudo cp -f /media/fat/MiSTer /media/fat/MiSTer_orig

# Check if MiSTer is running and stop it if necessary
if [[ ! -z $(pidof MiSTer) ]]; then
    sudo kill -9 $(pidof MiSTer)
fi

sudo cp -f MiSTer /media/fat/MiSTer
sudo chmod u+x /media/fat/MiSTer

# Copy over configs to setup lightgun as joystick correctly on MiSTer menu and in cores
sudo mkdir -p /media/fat/config/inputs
sudo cp -f /media/fat/Scripts/Sinden/MiSTerSindenDriver-main/Config/*.* /media/fat/config
sudo cp -f /media/fat/Scripts/Sinden/MiSTerSindenDriver-main/Config/inputs/*.* /media/fat/config/inputs

echo "Setup complete. Please reboot the MiSTer to apply changes."