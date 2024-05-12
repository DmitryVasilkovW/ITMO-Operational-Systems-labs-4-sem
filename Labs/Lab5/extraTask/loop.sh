#!/bin/bash


create_objects()
{
    arrays+=({1..10})
}

counter=0

arrays=()

while true;
do
    ((counter++))

    create_objects

    sleep 1
done
