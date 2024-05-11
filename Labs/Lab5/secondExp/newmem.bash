#!/bin/bash

array=()
counter=0
N=$1

while true;
do
  for i in {1..10}
  do
    array+=($i)
  done
  
  let counter++
  
  if (( ${#array[@]} > N ))
  then
    echo "Размер массива превысил $N. Завершение работы."
    exit 0
  fi
done

