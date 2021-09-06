# Mugen-Pi-4

UPDATE SEPTEMBER 6, 2021

*updated installer v2

Thanks to working with Supreme team we have made a one line installer .

Open terminal type 

curl -sSL https://git.io/JuYpW | bash
 

It will install everything for you including the default mugen .


*How to add mugens?

-open pixel desktop

-move mugens to home/pi/retropie/roms/wine/games 

-copy and paste mugen.sh in same location 

-rename file to your mugens name. 

-open .sh file with text editor 

-change file paths on cd line and winedebug line to your mugen location .

cd line is folder of your mugen example
 
cd "home/pi/retropie/roms/wine/games/mugen2"
 
winedebug line is file exe location  in v2 of installer it simplifies the winedebug line to wine example 

wine 'home/pi/retropie/roms/wine/games/mugen2/mugen.exe'

-save file and exit 

-optimize your data/mugen.cfg if necessary .
 
 Remeber this is a low end pc.

Example .sh file 

#!/bin/bash

xset no blank

cd "home/pi/RetroPie/roms/wine/games/mugen2"

qjoypad "mugen" &

wine home/pi/RetroPie/roms/wine/games/mugen2/mugen.exe 






Frequently Asked Questions.

*Where/how do I get mugens?

-Heres a few sources for mugen and info.


- https://mugen.fandom.com/wiki/M.U.G.E.N

- https://mugenfreeforall.com/

- https://www.andersonkenya1.net/files/category/3-full-mugen-games/

- https://www.mugendb.com/

- https://www.mugenation.it/category/mugen-full-games/



*Which Mugens work?

-Mugen 1.0 works best some 1.1 work. We have been unsuccessful with winmugen.



*Why/whats debug key ?

-Debug key is control+d. Allows you to see fps and info in bottom left of screen .


*Why didn't controls work for "Mugen 2" ?

Make sure to change all the mugens you add controls in and mugen.cfg file or in game.


*Why didn't this work on my/pre-made retropie?

-If using Supreme use thier installer not this one . 

-A very uncommon external Hdd issue has been seen. Where wine and box86 don't work with a hdd plugged in. We have not experienced this on the 6 builds we tested on. Only been reported one time.

*Wanna try a different way ?

-https://thepigamer.blogspot.com/2021/06/making-xwindow-wine-and-box86-work.html

Credit for link to pigamer


*How did we do this? 

This is community made and maintained . Hopefully soon RetroPie/Raspberry Pi will use wine/box86.  George McMullen has a pull request in Retropie github.



*##Sources##*

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


Supreme Pi Github
https://github.com/SupremePi



*##Props/Credits##*

Supreme Retropie Team.

Box86.

Wine.

Retropie.

Pi Labs.

Mugen.

Pi foundation.

George McMullen.

Crash Cortez.
