#!/bin/bash

SAVE2=/tmp/i3blocks_gpu_usage_4

declare -A graph=(
  ["11"]="\u28C0" # ⣀
  ["12"]="\u28E0" # ⣠
  ["13"]="\u28F0" # ⣰
  ["14"]="\u28F8" # ⣸
  ["21"]="\u28C4" # ⣄
  ["22"]="\u28E4" # ⣤
  ["23"]="\u28F4" # ⣴
  ["24"]="\u28FC" # ⣼
  ["31"]="\u28C6" # ⣆
  ["32"]="\u28E6" # ⣦
  ["33"]="\u28F6" # ⣶
  ["34"]="\u28FE" # ⣾
  ["41"]="\u28C7" # ⣇
  ["42"]="\u28E7" # ⣧
  ["43"]="\u28F7" # ⣷
  ["44"]="\u28FF" # ⣿
)

if [[ ! -f $SAVE2 ]]
then
  echo 1 1 1 1 > $SAVE2
fi

val=(`cat $SAVE2`)

usage=$((`nvidia-smi -q -a | grep  "Gpu" | grep "[0-9]*" -o | sed -n 1p`))

if [[ $usage -ge 75 ]]
then
  val=(${val[@]:1:3} 4)
elif [[ $usage -ge 50 ]]
then
  val=(${val[@]:1:3} 3)
elif [[ $usage -ge 25 ]]
then
  val=(${val[@]:1:3} 2)
else
  val=(${val[@]:1:3} 1)
fi
#echo $usage
echo -ne ${graph[${val[0]}${val[1]}]}${graph[${val[2]}${val[3]}]}
printf " %.2f%%\n" $((usage % 100))

echo ${val[@]} > $SAVE2
