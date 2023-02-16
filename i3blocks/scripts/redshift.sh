#!/usr/bin/env bash
# This shell script is PUBLIC DOMAIN. You may do whatever you want with it.

icon_color=${icon_color:-}
#status=$(pgrep redshift)
status=$(pgrep redshift)
if [[ -n "$status" ]]
then
    echo ""
    #echo "󰈈"
    #echo on
else
    echo ""
    #echo ""
    echo
    echo $icon_color
    #echo \#70797C 
    #839275
    #575758
    #70797C
    #6A6A6A
    #echo off
fi


exit 0




