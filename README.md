# Mugen-Pi-4

How to get mugen on Raspberry pi 4. Updated August 15, 2021

You will need

-pi 4.

-micro sd.

-keyboard.

-usb mouse.

-pc to burn/etch sd card.

Alright let's get started .

1.Download os of choice.

2.Update system  with following commands 

sudo apt-get update

sudo apt-get full-upgrade

If you know this will mess your build up don't do it .

3.Install Pixel

If this is a new retropie os do basic install first .

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

Exit wine desktop by clicking start then run then type "shutdown" and press ok or enter.

7. Replace Wine Desktop.sh 

Replace wine desktop.sh with the one in this github .

After you replace rename from Wine Desktop.sh to WineDesktop.sh

Then in terminal run

chmod +x /home/pi/RetroPie/roms/wine/WineDesktop.sh

Then rename from WineDesktop.sh to Wine Desktop.sh

Retest wine desktop .

8.Move Mugens to pi 

move games to /home/RetroPie/roms/wine/games This can be done many ways pixel desktop and midnight commander to name a few

9. Make Game Launch script

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

10.Install qjoypad

If your not in pixel open it. Then install Qjoypad with

sudo apt-get install qjoypad

11.Create a controller layout for mugen. 

Open qjoypad and make a layout called mugen. then map your controllers to buttons you wanna use in mugen. when you open mugen match these buttons.
Make sure you map escape key .

12.Open mugen config in yourmugen/data/mugen.cfg most the time .

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

13.Reboot To refresh the system 

Open terminal type sudo reboot .

14.Launch mugen 

If you made your .sh correct your mugen should appear under wine. Click play on it like any other game .

15.Map mugen controls to match qjoypad.

Best way is to leave your keyboard hooked up. Then go to input config in mugen, then f1 for player 1, then use your controller to map the button. 

16.Save your config in mugen menu .

17.Enjoy !!! 





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


*Why didn't controls work for "Mugen 2" ?

Make sure to change all the mugens you add controls in and mugen.cfg file or in game.


*Why didn't this work on my/pre-made retropie?

-Some builds already have box86 and wine installed example Twister Os.
With twister you'll have to find thier wine and direct to it in the shell script game launch script.

-Audio issue have been reported on one build with no pulse audio. 

-A very uncommon external Hdd issue has been seen. Where wine and box86 don't work with a hdd plugged in. We have not experienced this on the 6 builds we tested on. Only been reported one time.

*Wanna try a different way ?

-https://thepigamer.blogspot.com/2021/06/making-xwindow-wine-and-box86-work.html

Credit for link to pigamer


*How did we do this? 

This is community made and maintained . Hopefully soon RetroPie/Raspberry Pi will use wine/box86.  George McMullen has a pull request in Retropie github.



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

Pi Labs/Twister OS
https://twisteros.com


Props/Credits

Box86.

Wine.

Retropie.

Pi Labs 

Mugen.

Pi foundation.

George McMullen.

Crash Cortez.
