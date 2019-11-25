#!/bin/sh

smt=$(pgrep -il xcape)
if [ $? == 0 ]; then
	killall xcape
fi

setxkbmap gb
xmodmap ~/.Xmodmap
xcape -s -e 'Control_L=Return'
xcape -e 'Mode_switch=Escape'

	#xcape -e 'Mode_switch=Escape'
#xmodmap -e "keycode  53 = x X slash"

#xcape -e 'Mode_switch=colon=Return'
#xcape -e 'Control_L=Escape'
#xmodmap -e "keycode  53 = x X slash"

