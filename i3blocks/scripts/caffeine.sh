#!/bin/sh
# Copyright (C) 2014 Julien Bonjean <julien@bonjean.info>

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.




#pidx=$(pgrep -x xautolock)
#pids=$(pgrep -f sound_mntr)

#    if [ "$pidx" > "1" ] || [ "$pids" > "1" ] 
#    then
##        echo "﯈"
 #       echo
 #       echo \#70797C 
        #839275
        #575758
        
        
    
#    else
#        echo ""
#    fi


#status1=$(xset q | grep -c "Standby: 0")
#pidx=$(pgrep xautolock)
#pidy=$(pgrep -f fullscreen-sound-monitor)
#status2=$(ps p $pidy | grep -c "Ts")


icon_color=${icon_color:-}
pid=$(pgrep xidlehook)
status=$(ps p $pid | grep -c "Tl")

if [ "$status" -gt "0" ]
#if [[ "$status1" -gt "0" ]]
then
    #echo ""
    echo ""

else
    
    #echo "﯈"
    echo ""
    echo
    echo $icon_color
    #echo \#70797C 
    #839275
    #575758

fi






exit 0
