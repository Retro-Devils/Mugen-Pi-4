#!/bin/bash
#V1.0

setup_start() {
echo "$(tput setaf 6)
  _   _   _     _   _   _   _   _     _   _   _   _   _   _   _   _   _
 / \ / \ / \   / \ / \ / \ / \ / \   / \ / \ / \ / \ / \ / \ / \ / \ / \ 
( T | H | E ) ( M | U | G | E | N | ( I | N | S | T | A | L | L | E | R )
 \_/ \_/ \_/   \_/ \_/ \_/ \_/ \_/   \_/ \_/ \_/ \_/ \_/ \_/ \_/ \_/ \_/
  _   _     _   _   _     _   _   _   _   _   _   _     _   _   _   _  
 / \ / \   / \ / \ / \   / \ / \ / \ / \ / \ / \ / \   / \ / \ / \ / \ 
( B | Y ) ( T | H | E ) ( S | U | P | R | E | M | E ) ( T | E | A | M )
 \_/ \_/   \_/ \_/ \_/   \_/ \_/ \_/ \_/ \_/ \_/ \_/   \_/ \_/ \_/ \_/ 
  _   _   _     _   _   _   _   _     _   _   _   _   _   _  
 / \ / \ / \   / \ / \ / \ / \ / \   / \ / \ / \ / \ / \ / \ 
( A | N | D ) ( R | E | T | R | O ) ( D | E | V | I | L | S )
 \_/ \_/ \_/   \_/ \_/ \_/ \_/ \_/   \_/ \_/ \_/ \_/ \_/ \_/ 
$(tput sgr0)"
sleep 5
update_check
}


function update_check() { 
echo -e "$(tput setaf 2)
***Please note this install could take up to 40 mins*** 
$(tput sgr0)"
sleep 10
echo -e "$(tput setaf 2)
Lets first make sure your up to date!
$(tput sgr0)"
sleep 3
sudo apt -y clean
sleep 2
sudo apt-get -y update --allow-releaseinfo-change
sleep 2
#Double check update.
sudo apt -y update
sleep 2
sudo apt -y upgrade
sleep 2
echo -e "$(tput setaf 2)
Done!
$(tput sgr0)"
sleep 3
clear

install_retropie_scriptmodules
install_mugen_new
setup_controller
}

install_retropie_scriptmodules() {
echo -e "$(tput setaf 2)
Lets Now Install Needed RetroPie Scriptmodules.
$(tput sgr0)"
sleep 3

cd $HOME/RetroPie-Setup
git fetch --quiet
git reset --hard HEAD --quiet
git clean -d -f --quiet
git merge '@{u}' --quiet

git clone --branch emulator https://github.com/GeorgeMcMullen/rp-box86wine /home/pi/RetroPie-Setup/ext/rp-box86wineemu/ --quiet

#Quick fix for box86 error
awk '!/LICENSE/' /home/pi/RetroPie-Setup/ext/rp-box86wine/scriptmodules/emulators/box86.sh > /home/pi/RetroPie-Setup/ext/rp-box86wine/scriptmodules/emulators/tmpfile && mv /home/pi/RetroPie-Setup/ext/rp-box86wine/scriptmodules/emulators/tmpfile /home/pi/RetroPie-Setup/ext/rp-box86wine/scriptmodules/emulators/box86.sh

cd $HOME/RetroPie-Setup
sudo ./retropie_packages.sh raspbiantools lxde
sudo ./retropie_packages.sh mesa
sudo ./retropie_packages.sh box86
sudo ./retropie_packages.sh wine
sudo ./retropie_packages.sh raspbiantools package_cleanup


    if [[ ! -d /home/pi/RetroPie/roms/wine/wine-apps ]]; then
        mkdir /home/pi/RetroPie/roms/wine/wine-apps
    fi

sudo mv /home/pi/RetroPie/roms/wine/wine* /home/pi/RetroPie/roms/wine/wine-apps

#Add retro devils Desktop file
cat <<\EOF1010 > "/home/pi/RetroPie/roms/wine/Wine Desktop.sh"
#!/bin/bash

[[ ! -n "$(aconnect -o | grep -e TiMidity -e FluidSynth)" ]] && needs_synth="1"

function midi_synth() {
    [[ "$needs_synth" != "1" ]] && return

    case "$1" in
        "start")
            echo "Starting TiMidity"
            timidity -Os -iAD &
            i=0
            until [[ -n "$(aconnect -o | grep TiMidity)" || "$i" -ge 10 ]]; do
                sleep 1
                ((i++))
            done
            ;;
        "stop")
            echo "Stopping TiMidity"
            killall timidity
            ;;
        *)
            ;;
    esac
}

#
# Key lookup function from: https://stackoverflow.com/a/40646371
#
function configValueForKey() {
    if [[ -z "$1" ]] ; then
        echo ""
    else
        echo "$2" | /usr/bin/awk -v "id=$1" 'BEGIN { FS = "=" } $1 == id { print $2 ; exit }'
    fi
}

#
# Default variable values
#
WINEDEBUG=-all
LD_LIBRARY_PATH="/opt/retropie/supplementary/mesa/lib/" 
WINEPREFIX=""
cd /home/pi/RetroPie/roms/wine/

params=("$@")
echo "Launching Wine with params: ${params}"
if [[ -z "${params[0]}" || "${params[0]}" == *"Wine Desktop.sh" ]]; then
    echo "Launching Wine Desktop"
    xset -dpms s off s noblank
    matchbox-window-manager &
    setarch linux32 -L /opt/retropie/emulators/wine/bin/wine explorer /desktop=shell,`xrandr | grep current | sed 's/.*current //; s/,.*//; s/ //g'`
elif [[ "${params[0]}" == *Winetricks.sh ]]; then
    echo "Launching Winetricks"
    xset -dpms s off s noblank
    matchbox-window-manager &
    PATH="$PATH:/opt/retropie/emulators/wine/bin/:/home/pi/RetroPie/roms/wine/" BOX86_NOBANNER=1 setarch linux32 -L /home/pi/RetroPie/roms/wine/Winetricks.sh
elif [[ "${params[0]}" == *.sh ]]; then
    echo "Launching with script"
    midi_synth start
    bash "${params[@]}"
    midi_synth stop
    exit
elif [[ "${params[0]}" == *.conf ]]; then
    configFile=$(cat "${params[@]}")
    WINEPREFIX=$(configValueForKey WINEPREFIX "$configFile")
    DIRECTORY=$(configValueForKey DIRECTORY "$configFile")
    PROGRAM=$(configValueForKey PROGRAM "$configFile")
    OPTIONS=$(configValueForKey OPTIONS "$configFile")
    QJOYPADLAYOUT=$(echo $(basename "$(dirname "${PROGRAM}")"))

    echo "Launching with config file"
    echo "WINEPREFIX: $WINEPREFIX"
    echo "DIRECTORY: $DIRECTORY"
    echo "PROGRAM: $PROGRAM"
    echo "OPTIONS: $OPTIONS"
    echo "QJOYPADLAYOUT: $QJOYPADLAYOUT"

    if [[ "$DIRECTORY" ]]; then
        cd "$DIRECTORY"
    fi

    midi_synth start
    xset -dpms s off s noblank
    matchbox-window-manager &
    if [ -d "/home/pi/.qjoypad3" ]; then
        if [ -f "/home/pi/.qjoypad3/${QJOYPADLAYOUT}.lyt" ]; then
            qjoypad "$QJOYPADLAYOUT" &
            echo "Starting qjoypad with $QJOYPADLAYOUT"
        elif [ -f "/home/pi/.qjoypad3/WINE.lyt" ]; then
            qjoypad WINE &
            echo "Starting qjoypad with WINE"
        else
            qjoypad &
            echo "Starting qjoypad with default layout"
        fi
    fi
    setarch linux32 -L /opt/retropie/emulators/wine/bin/wine "${PROGRAM}" "${OPTIONS}"
    midi_synth stop
fi
EOF1010
}


install_mugen_new() {
    if [[ ! -d /home/pi/RetroPie/roms/wine/games ]]; then
        mkdir /home/pi/RetroPie/roms/wine/games
    fi

cd /home/pi/RetroPie/roms/wine/games/
wget -q http://network.mugenguild.com/justnopoint/mugen100.zip
unzip -o mugen100.zip
sudo rm mugen100.zip
sudo mv mugen Mugen
cd
sudo chmod 755 -R /home/pi/RetroPie/roms/wine/games/Mugen
sudo chown pi:pi -R /home/pi/RetroPie/roms/wine/games/Mugen
cat <<\EOF85222 > "/home/pi/RetroPie/roms/wine/games/mugen.sh"
#!/bin/bash

cd "/home/pi/RetroPie/roms/wine/games/Mugen"

qjoypad "mugen" &

WINEDEBUG=-all LD_LIBRARY_PATH="/opt/retropie/supplementary/mesa/lib/" setarch linux32 -L /opt/retropie/emulators/wine/bin/wine '/home/pi/RetroPie/roms/wine/games/Mugen/mugen.exe'
EOF85222
sudo chmod +x /home/pi/RetroPie/roms/wine/games/mugen.sh
echo -e "$(tput setaf 2)
Done!
$(tput sgr0)"
clear
sleep 3

sudo cat <<\EOF2323 > "/home/pi/Xwrapper.config"
# Xwrapper.config (Debian X Window System server wrapper configuration file)
#
# This file was generated by the post-installation script of the
# xserver-xorg-legacy package using values from the debconf database.
#
# See the Xwrapper.config(5) manual page for more information.
#
# This file is automatically updated on upgrades of the xserver-xorg-legacy
# package *only* if it has not been modified since the last upgrade of that
# package.
#
# If you have edited this file but would like it to be automatically updated
# again, run the following command as root:
#   dpkg-reconfigure xserver-xorg-legacy
allowed_users=anybod
needs_root_rights=yes
EOF2323
sudo chmod +x /home/pi/Xwrapper.config
sudo mv /home/pi/Xwrapper.config /etc/X11/Xwrapper.config
}

setup_controller() {
echo -e "$(tput setaf 2)
Now Installing Qjoypad for Mugen controller setup.
$(tput sgr0)"
sudo dpkg --configure -a
sudo apt-get install qjoypad
echo -e "$(tput setaf 2)
Done installing qjoypad, To set up Qjoypad please visit the pixel desktop to map your controler input and then save the layout as "mugen". Once this "mugen" layout is saved boot back into ES and copy your Qjoypad inputs for your mugen games.
$(tput sgr0)"
sleep 10
echo -e "$(tput setaf 2)
Now Rebooting to save changes, please wait...
$(tput sgr0)"
sleep 3
clear
sudo reboot
}

setup_start
