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
