#!/bin/bash

CURRENTMONTH=$(eval "date +%m");
eval "nitrogen --set-centered ~/.dotfiles/.i3/wallpaper/ESA-Calendar/Sentinel-Calendar-$CURRENTMONTH.jpg";
