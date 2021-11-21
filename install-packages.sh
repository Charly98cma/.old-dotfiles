#!/bin/bash

RMV_PACKAGES=(
    "pamac-gtk",
    "xautolock",
    "kvantum-qt5",
    "gcolor2",
    "lshw",
    "bmenu",
    "lxappearance"
    "epdfview",
    "viewnior",
    "moc",
    "bluemoon",
    "$(pacman -Qtdq)"
)

NEW_PACKAGES=(
    "linux-headers",
    "python3",
    "python-pip",
    "feh",
    "texlive-core",
    "terminus-font",
    "i3lock-color",
    "maven",
    "gparted",
    "evince",
    "ispell",
    "firefox",
    "escrotum",
    "inkspace",
    "telegram-desktop",
    "slack",
    "libreoffice-fresh",
    "gcc-ada",
    "terminator",
    "ttf-hack",
    "arandr",
)

# Update mirrors
# eval "sudo pacman-mirrors --country all --api --protocols all --set-branch stable && sudo pacman -Syyu"

# Uninstall packages
for pkg in RMV_PACKAGES
do
    eval "sudo pacman -Rscn ${pkg}"
done

# Install new packages
for pkg in NEW_PACKAGES
do
    eval "sudo pacman -S ${pkg}"
done
