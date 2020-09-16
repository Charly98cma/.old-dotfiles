#!/bin/bash

wallpaperPath="${HOME}/.dotfiles/.i3/lockscreen/StarTrek-Lockscreen.png"

color=F1DF6FFF
textPos=1066:900
indicatorPos=1066:434

dateSize=20
timeSize=25


i3lock \
    --image=${wallpaperPath}\
    --tiling \
    --ignore-empty-password \
    --force-clock \
    --timestr="%H:%M" \
    --timecolor=${color} \
    --timesize=${timeSize} \
    --datestr="%d/%m/%y" \
    --datecolor=${color} \
    --datesize=${dateSize} \
    --timepos="632:1025" \
    --datepos="632:1060" \
    --nofork \
    --lockfailedtext="Failed to lock... Try again" \
    --noinputtext="" \
    --verifcolor=ACAEE8FF \
    --wrongcolor=FF0000FF \
    --wrongpos=${textPos} \
    --verifpos=${textPos} \
    --indpos=${indicatorPos} \
    --radius=146 \
    --ringcolor=${color} \
    --insidecolor=00000000 \
    --veriftext="Checking Starfleet identity..." \
    --wrongtext="Logging failed... SHIELDS UP! RED ALERT!" \
    --locktext="" \
    
