#!/bin/bash

> report.log
array=()
counter=0

while true;
do
  for i in {1..10}
  do
    array+=($i)
  done
  
  let counter++
  
  if (( counter % 100000 == 0 ))
  then
    echo ${#array[@]} >> report.log
  fi
done

