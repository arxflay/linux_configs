#!/bin/sh
export LD_PRELOAD=/usr/lib/libwcwidth-icons.so
feh --bg-scale pui695.jpg
 /usr/share/dwm_modules/dwm-bar/dwm_bar.sh &
 compton --config ~/.config/compton.conf
