
#copy custom cores that have Sinden border built in
cd /home/alarm/Lightgun/MiSTerSindenDriver-main/Cores
sudo mkdir /media/fat/_Console/
sudo cp -p *.rbf /media/fat/_Console/
sudo chmod 755 /media/fat/_Console/*.rbf

#copy startup scripts to easily start and stop the lightgun
cd /home/alarm/Lightgun/MiSTerSindenDriver-main/StartupScripts
sudo cp *.sh /MiSTer/scripts
sudo chmod +x /MiSTer/scripts/*.sh

#copy lightgun driver
cd /home/alarm/Lightgun/MiSTerSindenDriver-main/LightgunDriver
sudo cp *.* /home/alarm/Lightgun/
sudo cp lib*.* /usr/lib/

#copy tweaked kernel
cd /home/alarm/Lightgun/MiSTerSindenDriver-main/Kernel/MOnSieurFPGA/28thFeb2022/
sudo cp /boot/linux/zImage_dtb /boot/linux/zImage_dtb_backup
sudo cp zImage_dtb /boot/linux/zImage_dtb

#now update MiSTer to be able to read the Sinden lightgun joystick
cd /home/alarm/Lightgun/MiSTerSindenDriver-main/MiSTerUpdate
sudo cp /usr/bin/MiSTer /usr/bin/MiSTer_orig
#need to close MiSTer on the front end
sudo pkill -f MiSTer

sudo cp MiSTer /usr/bin/MiSTer
sudo chmod u+x /usr/bin/MiSTer

#assign video/serial permissions so lightgun driver can run without sudo
sudo usermod -a -G uucp alarm
sudo usermod -a -G video alarm



