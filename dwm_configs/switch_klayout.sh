#!/bin/bash
Layout=`setxkbmap -query | awk '/layout/{print $2}'`
if [ "$Layout" = "us" ]; then
	setxkbmap -layout ru
elif [ "$Layout" = "ru" ]; then
	setxkbmap -layout cz
else
	setxkbmap -layout us
fi
