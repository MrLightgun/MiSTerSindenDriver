#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Define the path for Sinden scripts
SINDEN_SCRIPTS_PATH="/media/fat/Scripts/Sinden"

# Copy custom cores and mgl files that have Sinden border built in
cd $SINDEN_SCRIPTS_PATH/MiSTerSindenDriver-main/Cores
mkdir -p /media/fat/Light\ Gun/
cp -f *.rbf /media/fat/Light\ Gun/
chmod 755 /media/fat/Light\ Gun/*.rbf
echo "Moved Sinden Core Files."

cd $SINDEN_SCRIPTS_PATH/MiSTerSindenDriver-main/mgl
mkdir -p /media/fat/_Console/
cp -f *.mgl /media/fat/_Console/
chmod 755 /media/fat/_Console/*.mgl
mv /media/fat/_Console/InputTest\ Light\ Gun.mgl  /media/fat/_Utility
echo "Moved Sinden mgl Files."

# Copy startup scripts to easily start and stop the lightgun
cd $SINDEN_SCRIPTS_PATH/MiSTerSindenDriver-main/StartupScripts
cp -f *.sh /media/fat/Scripts

# Copy tweaked kernel
cd $SINDEN_SCRIPTS_PATH/MiSTerSindenDriver-main/Kernel/MiSTerFPGA/MrFusion2.7/
cp -f /media/fat/linux/zImage_dtb /media/fat/linux/zImage_dtb_backup
cp -f zImage_dtb /media/fat/linux/zImage_dtb


# Copy over configs to setup lightgun as joystick correctly on MiSTer menu and in cores
mkdir -p /media/fat/config/inputs
cp -f $SINDEN_SCRIPTS_PATH/MiSTerSindenDriver-main/Config/*.* /media/fat/config
cp -f $SINDEN_SCRIPTS_PATH/MiSTerSindenDriver-main/Config/inputs/*.* /media/fat/config/inputs
echo "Moved Sinden CFG Files."

# Start the driver automatically at boot. MiSTer runs
# /media/fat/linux/user-startup.sh - note the file it ships as an example,
# _user-startup.sh (leading underscore), is NOT run by MiSTer, so without this
# step the driver only ever runs if you start it by hand from the Scripts menu
# after every power-on.
HOOK=/media/fat/linux/user-startup.sh
if ! grep -q "SindenLightgunStart" "$HOOK" 2>/dev/null; then
    [ -f "$HOOK" ] && cp "$HOOK" "$HOOK.pre-sinden.bak"
    cat >> "$HOOK" <<'EOS'

# Sinden Lightgun driver autostart.
# Poll for the gun's serial interface and camera rather than sleep a fixed
# guess: too short races USB enumeration, too long leaves the gun dead for no
# reason after every boot.
(
    i=0
    while [ $i -lt 60 ]; do
        if ls /dev/ttyACM* >/dev/null 2>&1 && [ -e /dev/video0 ]; then
            sleep 2
            /bin/bash /media/fat/Scripts/SindenLightgunStart_Default.sh
            exit 0
        fi
        sleep 1
        i=$((i + 1))
    done
) &
EOS
    chmod +x "$HOOK"
    echo "Added Sinden driver autostart to $HOOK."
else
    echo "Sinden driver autostart already present in $HOOK - left unchanged."
fi

rm -rf $SINDEN_SCRIPTS_PATH/MiSTerSindenDriver-main/mgl
echo "Removed Setup mgl Files."
rm -rf $SINDEN_SCRIPTS_PATH/MiSTerSindenDriver-main/Cores
echo "Removed Setup core Files."
rm -rf $SINDEN_SCRIPTS_PATH/MiSTerSindenDriver-main/Config
echo "Removed Setup CFG Files."
rm -rf $SINDEN_SCRIPTS_PATH/MiSTerSindenDriver-main/StartupScripts
echo "Removed Setup Scripts Files."

echo "Setup complete. Please reboot the MiSTer to apply changes."