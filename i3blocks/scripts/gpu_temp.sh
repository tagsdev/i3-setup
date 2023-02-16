#!/bin/bash

usage=$(nvidia-smi -q -a | grep -i "GPU Current" | grep "[0-9]*" -o | sed -n 1p)



if (( "${usage}" > "60" )); then
	echo " ${usage}°C"	

else
	echo " ${usage}°C"
fi

#echo $usage
