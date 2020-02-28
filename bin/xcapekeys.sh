#!/bin/sh

case $1 in
	moderight)
		xcape -s -e 'Control_L=Return'
		xcape -e 'ISO_Level3_Shift=Escape'
		xcape -e 'Shift_L=slash'
		exit 0 ;;
	modeleft)
		xcape -e 'Control_L=Return'
		xcape -e 'Mode_switch=Escape'
		exit 0 ;;
	altmodeleft)
		xcape -e 'Control_L=Return'
		xcape -e 'Mode_switch=Escape'
		xcape -e 'ISO_Level3_Shift=colon'
		exit 0 ;;
	pgmode)
		xcape -s -e 'ISO_Level3_Shift=Return'
		xcape -e 'Shift_L=Escape'
		xcape -e 'Control_L=Escape'
		xcape -e 'Mode_switch=colon'
		exit 0 ;;
	multimode)
		xcape -s -e 'ISO_Level3_Shift=Return'
		xcape -e 'Shift_L=Escape'
		xcape -e 'Control_L=F21'
		xcape -s -e 'Mode_switch=backslash'
		exit 0 ;;
	isomode)
	  xcape -s -e 'ISO_Level3_Shift=KP_Subtract'
		xcapemod -s -e 'Shift_L=Escape'
		xcape -s -e 'Control_L=backslash'
		xcape -s -e 'Mode_switch=Return'
		exit 0 ;;
	newmode)
	  xcape -s -e 'ISO_Level3_Shift=KP_Subtract'
		xcapemodb -s -e 'Shift_L=KP_Add'
		xcape -s -e 'Control_L=backslash'
		xcape -s -e 'Mode_switch=Return'
		exit 0 ;;
	funnykeys3)
		xcape -s -e 'ISO_Level3_Shift=Return'
		xcape -e 'Shift_L=Escape'
		xcape -e 'Control_L=Escape'
		xcape -s -e 'Mode_switch=bar'
		exit 0 ;;
	shiftmode)
		xcape -s -e 'ISO_Level3_Shift=Return'
		xcape -e 'Shift_L=Escape'
		xcape -e 'Control_L=Escape'
		exit 0 ;;
	testmode)
		xcape -s -e 'ISO_Level3_Shift=space'
		xcape -s -e 'Shift_R=F3'
		xcape -e 'Shift_L=F9'
	  xcape -s -e 'Mode_switch=backslash'
		xcape -s -e 'Control_L=F4'
		exit 0 ;;
	spacemode)
		xcape -s -e 'ISO_Level3_Shift=space'
	  xcape -s -e 'Mode_switch=KP_Subtract'
		xcapemod -s -e 'Shift_L=KP_Add'
		xcape -s -e 'Super_L=backslash'
		xcape -s -e 'Control_L=Return'
		exit 0 ;;
esac
