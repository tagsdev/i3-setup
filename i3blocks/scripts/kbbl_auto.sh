#!/bin/sh


icon_color=${icon_color:-}
status=$(systemctl status tp-auto-kbbl | grep -c 'running')

if [[ "$status" -gt "0" ]]
then
    echo ""
else
    
    echo ""
    echo
    echo $icon_color
    #echo \#70797C 
    #839275
    #575758
fi


exit 0
