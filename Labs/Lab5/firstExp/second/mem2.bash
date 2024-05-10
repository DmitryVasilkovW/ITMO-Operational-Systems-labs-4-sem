#!/bin/bash

> report2.log
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
    echo ${#array[@]} >> report2.log
  fi
done

