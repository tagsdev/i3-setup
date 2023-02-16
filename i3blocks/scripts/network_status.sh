#!/usr/bin/env bash

#taguiad 2020-10-29
#network monitor

icon_color=${icon_color:-}

ssid=$(nmcli -t -f active,ssid dev wifi | egrep '^yes' | cut -d\: -f2)
#wifi_level=$(nmcli device wifi  | grep "*" | awk '{print $8}')
status=$(nmcli device status | grep -c -w "connected")

readarray -t output <<< $(nmcli device status | grep -w "connected")
network_count=${#output[@]}

#up_color="${FULL_COLOR:-#FFFFFF}"
#down_color="${AC_COLOR:-#70797C}"



for line in "${output[@]}";
do
  

  interface=$(echo "$line" | awk '{print $1}')
  int_type=$(echo "$line" | awk '{print $2}')
  connection=$(echo "$line" | awk '{print $4}')
  

  if [[ "$int_type" == "wifi" ]]; then
    output1+=(" $interface" )
    wifi_level=$(iw dev $interface link | grep 'dBm$' | grep -Eoe '-[0-9]{2}' | awk '{print  ($1 > -50 ? 100 :($1 < -100 ? 0 : ($1+100)*2))}')

    output2+=(" $interface  [$connection $wifi_level%]  ")
    #output2+=(" $interface  [$connection]  ")

  elif [[ "$int_type" == "ethernet" ]]; then
    output1+=(" $interface " )
    output2+=(" $interface  [$connection] ")

  elif [[ "$int_type" == "bt" ]]; then
    output1+=(" bnep0" )
    output2+=(" bnep0  [$connection] ")
    
  elif [[ "$int_type" == "tun" ]]; then
    output1+=(" $interface " )
    output2+=(" $interface  [$connection] ")
  fi
done


end=$(($network_count - 1))
for i in $(seq 0 $end);
do

  if (( $status > 0 )) ; then 
      
    if (( $end > 0 )) ; then 
      message="$message $(($i + 1)):" 
      #message="$message"
    fi

    if [[ "$BLOCK_BUTTON" -eq 2 ]]; then 
          #pkill -SIGRTMIN+9 i3blocks   

      message="$message  ${output2[$i]}"

    else
      #message="$message ${interface[$i]} "
      
      message="$message ${output1[$i]}"

    fi

    


    
      
  else
      
    message=" down"
        
  fi
    
    
done

#echo $message

if (( $status > 0 )) ; then 
  echo $message
  
  
else
  echo $message
  echo
  echo $icon_color
  #echo \#70797C
  
  
fi