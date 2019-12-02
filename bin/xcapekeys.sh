#!/bin/sh

case $1 in
	moderight)
		xcape -e 'Control_L=Escape'
		xcape -e 'Mode_switch=colon'
		exit 0 ;;
	modeleft)
		xcape -e 'Control_L=Return'
		xcape -e 'Mode_switch=Escape'
		exit 0 ;;
esac
