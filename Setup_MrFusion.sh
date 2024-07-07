
#copy custom cores that have Sinden border built in
cd /media/fat/Lightgun/MiSTerSindenDriver-main/Cores
sudo mkdir /media/fat/_Console/
sudo cp *.rbf /media/fat/_Console/
sudo chmod 755 /media/fat/_Console/*.rbf

#copy startup scripts to easily start and stop the lightgun
cd /media/fat/Lightgun/MiSTerSindenDriver-main/StartupScripts/MrFusion
sudo cp *.sh /media/fat/scripts
sudo chmod +x /media/fat/scripts/*.sh

#copy lightgun driver
cd /media/fat/Lightgun/MiSTerSindenDriver-main/LightgunDriver
sudo cp *.* /media/fat/Lightgun/
sudo cp LightgunDriver /media/fat/Lightgun/LightgunDriver
cd /media/fat
sudo mkdir usr
cd usr
sudo mkdir lib
sudo cp /media/fat/Lightgun/lib* /usr/lib

#copy tweaked kernel
cd /media/fat/Lightgun/MiSTerSindenDriver-main/Kernel/MiSTerFPGA/MrFusion2.7/
sudo cp /media/fat/linux/zImage_dtb /media/fat/linux/zImage_dtb_backup
sudo cp zImage_dtb /media/fat/linux/zImage_dtb

#now update MiSTer to be able to read the Sinden lightgun joystick
cd /media/fat/Lightgun/MiSTerSindenDriver-main/MiSTerUpdate
sudo cp /media/fat/MiSTer /media/fat/MiSTer_orig
#may need to close MiSTer on the front end
kill -9 $(pidof MiSTer)

sudo cp MiSTer /media/fat/MiSTer
sudo chmod u+x /media/fat/MiSTer

#Copy over configs to setup lightgun as joystick correctly on MiSTer menu and in cores
sudo mkdir /media/fat/config/inputs
sudo cp /media/fat/Lightgun/MiSTerSindenDriver-main/Config/*.* /media/fat/config
sudo cp /media/fat/Lightgun/MiSTerSindenDriver-main/Config/inputs/*.* /media/fat/config/inputs


