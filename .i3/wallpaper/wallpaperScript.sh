#!/bin/bash

CURRENTMONTH=$(eval "date +%m")

case $CURRENTMONTH in
	"01")
		wallpaper="Enero"	
	;;
	"02")
		wallpaper="Febrero"
	;;
	"03")
		wallpaper="Marzo"
	;;
	"04")
		wallpaper="Abril"
	;;
	"05")
		wallpaper="Mayo"
	;;
	"06")
		wallpaper="Junio"
	;;
	"07")
		wallpaper="Julio"
	;;
	"08")
		wallpaper="Agosto"
	;;
	"09")
		wallpaper="Septiembre"
	;;
	"10")
		wallpaper="Octubre"
	;;
	"11")
		wallpaper="Noviembre"
	;;
	"12")
		wallpaper="Diciembre"
	;;
esac

eval "nitrogen --set-centered ~/.dotfiles/.i3/wallpaper/ESA-Calendar/Sentinel-Calendar-'$wallpaper'.jpg"
