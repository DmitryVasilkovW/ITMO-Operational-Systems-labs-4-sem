#!/bin/bash

function info() {
  local file=$1 
  proc_info=$(ps -Ao pid,cmd | tail -n +2 | awk ' {print $1": "$2}')
  
  for i in $proc_info; do 
    pid=$(echo $i | awk -F ":" '{print $1}') 
    com=$(echo $i | awk -F ":" '{print $2}') 
    path="/proc/"$pid
    
    if [ -f $path/io ]; then
      byte=$(grep -h "read_bytes:" $path/io | sed "s/[^0-9]*//") 
      echo "$pid $com $byte"
    fi 
  done | sort -nk1 > $file
}

info _a 

sleep 60

info _b

cat _a | 
while read str; do
  pid=$(awk '{print $1}' <<< $str) 
  com=$(awk '{print $2}' <<< $str) 
  mem1=$(awk '{print $3}' <<< $str)
  mem2=$(cat _b | awk -v id="$pid" '{if ($1 == id) print $3}')
  res=$(echo "$mem2-mem1" | bc)
  echo $pid" : "$com" : "$res
done | sort -t ':' -nrk3 | head -3 > task7.txt

rm _a
rm _b
