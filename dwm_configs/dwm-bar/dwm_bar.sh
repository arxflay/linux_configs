#!/bin/sh

# A modular status bar for dwm
# Joe Standring <git@joestandring.com>
# GNU GPLv3

# Dependencies: xorg-xsetroot

# Import functions with "$include /route/to/module"
# It is recommended that you place functions in the subdirectory ./bar-functions and use: . "$DIR/bar-functions/dwm_example.sh"

# Store the directory the script is running from
LOC=$(readlink -f "$0")
DIR=$(dirname "$LOC")

# Change the appearance of the module identifier. if this is set to "unicode", then symbols will be used as identifiers instead of text. E.g. [📪 0] instead of [MAIL 0].
# Requires a font with adequate unicode character support
export IDENTIFIER="unicode"

# Change the charachter(s) used to seperate modules. If two are used, they will be placed at the start and end.
export SEP1=" "
export SEP2=" "

# Import the modules
#. "$DIR/bar-functions/dwm_battery.sh"
. "$DIR/bar-functions/dwm_pulse.sh"
#. "$DIR/bar-functions/dwm_weather.sh"
. "$DIR/bar-functions/dwm_keyboard.sh"
. "$DIR/bar-functions/dwm_date.sh"
. "$DIR/bar-functions/dwm_networkmanager.sh"

# Update dwm status bar every second
while true
do

    # Append results of each func one by one to a string
    dispstr=""
#    dispstr="$dispstr$(dwm_battery)"
    dispstr="$dispstr$(dwm_networkmanager)"
    dispstr="$dispstr$(dwm_pulse)"
#    dispstr="$dispstr$(dwm_weather)"
    dispstr="$dispstr$(dwm_keyboard)"
    dispstr="$dispstr$(dwm_date)"

    xsetroot -name "$dispstr"
    sleep 1

done
