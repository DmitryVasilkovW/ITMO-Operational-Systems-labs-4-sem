#!/bin/bash

genpid=$1

tail -n 1 -f pipe |
while true;
do
  read line

 if [ "$line" = "Акулы приближаются" ];
 then
    kill -9 $genpid
    echo "Спасен"
    exit 1
  elif [ "$line" = "Они здесь" ];
  then
    echo "Слишком поздно, акулы уже здесь"
    exit 1
  fi
  
  sleep 1
done
