# Mugen-Pi-4

- UPDATED October 11, 2021

# Updated Installer  to V3

- Thanks to working with Supreme team we have made a one line installer .

- V3 is 90% Supremes work. 

# V3 is a MAJOR UPDATE . 

  - No more scripts it directly launches exes from retropie.

  - Qjoypad auto loads layout with same name as exe.
  
# To Install 

- Open terminal (press f4 in retropie) type

curl -sSL https://git.io/Jz9O3 | bash
 
- Depending on your build and what you have/want installed select your option.
If you don't know select mugem with all updates .

- Go get a coffee/cigarette/drink this will take some time

- If successful it will return to retropie with a new wine category , with default mugen inside of it .

# For your Info 

- This installer installs wine and box86 . 

- This installer can used to play a bunch of old windows games. 

- Optimization of Wine emu is possible will add a better performance area soon .

# Frequently Asked Questions 

# How to add mugens?

- Open pixel desktop

- Move mugens to home/pi/retropie/roms/wine/games  

- Optimize your data/mugen.cfg if necessary .

- Rename your exe to mugen.exe .

- Return to Retropie then restart emulation station . 

- If successful your game should be under wine/games/mugenfoldername/ in retropie.

# How to add old Windows games ? 

- Open pixel desktop

- Move games folder to home/pi/retropie/roms/wine/games

- Make a qjoypad layout for your game described below . 

- Reboot system . 

- Your game should now be in wine/games . 

- If done correct qjoypad will autoload your layout 

# How do I configure controls? (for games other than mugen) 

- Open pixel desktop 

- Go to menu/games . Then click qjoypad . 

- Click on qjoypad icon in system tray .

- Click add layout .

- Name layout same as exe name . example want mugen controls name mugen then name mugen exes mugen.exe. THIS IS CASE SENSITIVE. 

- Click quick set .

- Press button want to map then button your mapping to.  Example want a button to be left click, press a then left click. 

- Repeat this for all buttons you want mapped .

- When finished click save . 

- Go back to retropie. Restart es and load game .

# How do I config controls for new/added mugen? 

- Open pixel

- Find and rename you exe to mugen.exe.

- If controller is different than ps3 style. Follow above config just edit mugen layout. 

- With keyboard attached open mugen in retropie . 

- Match this controls below and turn off joysticks. This is what included mugen layout is trying to do . 

player 1.       player 2. 
up-w.           up-up
down-s.         down-down
left-a.         left-left
right-d.        right-right
A-i.            A-1
B-o.            B-2
C-p.            C-3
X-j.            X-4
Y-k.            Y-5
Z-l.            Z-6
Start-enter.    Start-right enter
Select-escape.  Select-escape 

# Where/how do I get mugens?

- Heres a few sources for mugen and info.

- https://mugen.fandom.com/wiki/M.U.G.E.N

- https://mugenfreeforall.com/

- https://www.andersonkenya1.net/files/category/3-full-mugen-games/

- https://www.mugendb.com/

- https://www.mugenation.it/category/mugen-full-games/



# Which Mugens work?

- Mugen 1.0 works best some 1.1 work. We have been unsuccessful with winmugen.

**Heres a list of working MUGENS. Sourced from  RetroPie community and Retro Devils. Mainly from RetroPie forum. If you see double if was  tested by two or more people/teams.

**Gamer007s Mugen list:

-Hyper Comic Book Marvel vs Capcom Extreme Battle Royal

-Capcom vs SNK 2.5 Remix

-DC Universe

-DC Mugenation

-Heroes Collide

-Homem-Aranha Amigo Ou Inimigo (Spider-man Friend or Foe)

-Spiderman Fight Night

-Hyper Dragonball Z

-Jojo's Bizzare Adventure Requiem

-King of Fighters Old School

-Kingdom Hearts

-King of Fighters Alpha V1

-King of Fighters Alpha V2

-King of Fighters Memorial Special Edition

-Marvel vs Capcom All Generations

-Marvel vs Capcom Origins

-Marvel vs Capcom vs SNK Screenpack 1.0 (Full Game)

-Multiverse Cross Generation of Fighters

-Marvel vs Capcom Clash of Superheroes

-Meltyblood vs Darkstalkers

-Metal Slug

-Mortal Kombat 11

-Mortal Kombat Special Edition

-Ninja Master Heat

-Super Smash Bros.

-Super Smash Bros. Clash

-Super Fighter Team

-Super V.G.

-The Black Heart

-Darkstalkers Jedah's Damnation

**Various People:

-Dark Stalkers  vs Street Fighter 

-DC vs Marvel 

-Disney Edition 

-Disney vs Capcom 

-Dragon Ball Z Fury Budokai 

-Famicom Fighters 

-Gundam Wing 

-Heroes 

-Infinity M Battle 

-JoJos Bizarre Adventure 

-Justice League Task Force 

-King of Fighters '98 

-Kirby Dean Battle 

-Marvel Fighting Tournament 

-Marvel vs Avengers 

-Marvel vs Capcom 

-Mega Man Robot Master Mayhem 

-MK Remake Gore 

-MK Anthology 

-Nemesis Diamond Veal 

-Neo Geo Battle Collesium 

-One Piece 

-Power Rangers 

-Queen of Fighters 

-Real Bout Fatal Fury 

-Resident Evil 

-Sonic Fighters 2 

-Street Fighter Alpha 4 

-Super Smah Bros 

-Super Heroes 2000 

-The Black Heart 

-King of Fighters Super Nova 

-Towers Compilation 

-Transformer Mugen nation

**Tested Windows Games 

work in progress 

# Why/whats debug key ?

- Debug key is control+d. Allows you to see fps and info in bottom left of screen .


# Why didn't controls work for "Mugen 2" ?

- Make sure to change all the mugens you add controls in and mugen.cfg file or in game.

-If your exe name is not mugen.exe . Qjoyoad will not load mugen layout to map your. ontroller to keyboard buttons. 

# Why didn't this work on my/pre-made retropie?

- If using Supremes image use thier installer not this one . 

- If you have wine,box86, and mesa installed remove them then try again.

- Wine doesn't function correctly in a  64 bit os atm.

- You have to RetroPie installed for this to work .

- Feel free to contact us or put in a error/pull request .

# Wanna try a different way ?

- https://thepigamer.blogspot.com/2021/06/making-xwindow-wine-and-box86-work.html

Credit for link to pigamer

# What other games work ? 

-A bunch heres a list on retropie forum.Differwnt method same results, emus etc.

https://retropie.org.uk/forum/topic/29241/the-which-games-works-with-box86-wine-topic-on-the-retropie-rpi4-400

# How did we do this? 

- This is community made and maintained . Hopefully soon RetroPie/Raspberry Pi will use wine/box86.  George McMullen has a pull request in Retropie github.

-With V3 major props to Supreme Retro Gaming . They worked hard and made it so much better. 

# Sources

# Box86 Github 
- https://github.com/ptitSeb/box86

# Retropie Github 
- https://github.com/retropie

# Mugen 
- Can be found many places. Orginal website is down.

# Georges Github 
- https://github.com/GeorgeMcMullen/rp-box86wine

# Retropie Box86 Forum 
- https://retropie.org.uk/forum/topic/28528/box86-and-wine-on-rpi4/358

# Pi Labs/Twister OS
- https://twisteros.com


# Supreme Retro Gaming Github
- https://github.com/SupremePi



# Props/Credits 

- Supreme Retro Gaming Team.

- Box86.

- Wine.

- Retropie.

- Pi Labs.

- Mugen.

- Pi foundation.

- George McMullen.

- Crash Cortez.
