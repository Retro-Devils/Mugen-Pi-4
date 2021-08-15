# Mugen-Pi-4

How to get mugen on Raspberry pi 4. 

You will need

-pi 4.

-micro sd.

-keyboard.

-usb mouse.

-pc to burn/etch sd card.

Alright let's get started .

1.Download os of choice.

2.update with 

sudo apt-get update

3.Install Pixel

Go to retropie setup/configurations&tools/raspbiantools/install pixel 

4.Install Georges retropi setup extras

open pixel desktop 

open terminal type

git clone --branch emulator https://github.com/GeorgeMcMullen/rp-box86wine /home/pi/RetroPie-Setup/ext/rp-box86wineemu/

After completion of above script 

In terminal type 

emulationstation 

work like this for now .

5.Update RetroPie-Setup and install scripts

In retropie menu go to retropie-setup

Launch RetroPie Setup, update retropie setup, then go to "Manage Packages". Then run these scripts in this order:

dependencies/mesa

experimental/box86

experimental/wine

6.Reboot your system and test wine/box86

Reboot your system in retropie menu or pixel .

After reboot you should see a wine category with Wine Desktop in it.

Click on Wine Desktop. If wine doesn't launch Mugen wont.

7.Move Mugens to pi 

move games to /home/RetroPie/roms/wine/games This can be done many ways pixel desktop and midnight commander to name a few

8. Make Game Launch script

Use the shell script method. in terminal type

sudo nano /home/pi/RetroPie/roms/wine/mugennamehere.sh

replace mugennamehere with your mugens name .

copy following into your new .sh 

#!/bin/bash

xset -dpms s off s noblank

cd "/home/pi/RetroPie/roms/wine/games/yourmugenfolder/"

matchbox-window-manager &

qjoypad "mugen" &

WINEDEBUG=-all LD_LIBRARY_PATH="/opt/retropie/supplementary/mesa/lib/" setarch linux32 -L /opt/retropie/emulators/wine/bin/wine '/home/pi/RetroPie/roms/wine/games/yourmugenfolder/mugennamehere.EXE'

Another example 

#!/bin/bash

cd"/home/pi/Retropie/roms/wine/games/yourmugenfolder"

qjoypad "mugen" &

WINEDEBUG=-all LD_LIBRARY_PATH="/opt/retropie/supplementary/mesa/lib/" setarch linux32 -L /opt/retropie/emulators/wine/bin/wine '/home/pi/RetroPie/roms/wine/games/yourmugenfolder/mugennamehere.EXE'

Easiest way to get paths for mugens is right click your exe and copy paths .

Then replace "home/pi.......yourmugenfolder/" on cd line above. with your paths to folder containing exe.

Then replace 'home/pi......mugennamehere.exe' on wine line with your paths to exe .

Exit nano with control+X then control+Y this saves your new .sh script.

9.Install qjoypad

If your not in pixel open it. Then install Qjoypad with

sudo apt-get install qjoypad

10.Create a controller layout for mugen. 

Open qjoypad and make a layout called mugen. then map your controllers to buttons you wanna use in mugen. when you open mugen match these buttons.
Make sure you map escape key .

11.Open mugen config in yourmugen/data/mugen.cfg most the time .

then find and change the followinfor best performance .

-Allowdebugmode = 1

-Allowdebugkeys = 1.

-Video Settings

     Width = 1280

     Height = 720

-Fullscreen = 1

-Rendermode = OpenGL

-Blitmode = Normal

-Joystick input for both players =0

-Keep AspectRatio=1

12.open terminal type sudo reboot

13.Find mugen in retropie press play .

14.Map controls to match qjoypad.

15.Save your config in mugen menu .

Thats it. Repeat for your Mugens and enjoy .





Frequently Asked Questions.



*Where/how do I get mugens?

-Heres a few sources for mugen and info.


- https://mugen.fandom.com/wiki/M.U.G.E.N

- https://mugenfreeforall.com/

- https://www.andersonkenya1.net/files/category/3-full-mugen-games/

- https://www.mugendb.com/

- https://www.mugenation.it/category/mugen-full-games/

-Soon the Retro Devils will have a install script for mugens to download from our mediafire .



*Which Mugens work?

-Mugen 1.0 works best some 1.1 work. We have been unsuccessful with winmugen.



*Why/whats debug key ?

-Debug key is control+d. Allows you to see fps and info in bottom left of screen .



*Why didn't this work on my/pre-made retropie?

-Some builds already have box86 and wine installed example Twister Os.
With twister you'll have to find thier wine and direct to it in the shell script game launch script.

-Audio issue have been reported on one build with no pulse audio. 

-A very uncommon external Hdd issue has been seen. Where wine and box86 don't work with a hdd plugged in. We have not experienced this on the 6 builds we tested on. Only been reported one time.


*How did we do this? 

This is community made and maintained . Hopefully soon RetroPie/Raspberry Pi will use it soon.  George McMullen has a pull request in Retropie github.



Sources 

Box86 Github 
https://github.com/ptitSeb/box86

Retropie Github 
https://github.com/retropie

Mugen 
Can be found many places. Orginal website is down.

Georges Github 
https://github.com/GeorgeMcMullen/rp-box86wine

Retropie Box86 Forum 
https://retropie.org.uk/forum/topic/28528/box86-and-wine-on-rpi4/358


Props/Credits

Box86.

Retropie.

Mugen.

Pi foundation

George McMullen
