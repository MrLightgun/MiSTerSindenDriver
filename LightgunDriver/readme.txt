still need all the existing pre-reqs except the mono ones.

copy this folder onto MiSTer into a suitable folder


copy the 4 lib files into /usr/lib/

sudo cp lib* /usr/lib/

give execute permissions on LightgunDriver

sudo chmod +x LightgunDriver

then run for the efficient MiSTer mode

sudo ./LightgunDriver joystick lowresource

or to use more resource but get better performance

sudo ./LightgunDriver joystick mediumresource

or to have no caps on performance (not recommended as likely to cause bad performance due to low resources)

sudo ./LightgunDriver joystick







