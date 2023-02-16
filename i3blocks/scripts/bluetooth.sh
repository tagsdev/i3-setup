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


icon_color=${icon_color:-}
GET_BLUE=$(rfkill list bluetooth | grep yes)

if [[ $GET_BLUE == *"yes"* ]]
then
    #echo ""
    echo ""
    echo
    echo $icon_color
    #echo \#70797C
    
else
    echo ""
 
fi

exit 0
