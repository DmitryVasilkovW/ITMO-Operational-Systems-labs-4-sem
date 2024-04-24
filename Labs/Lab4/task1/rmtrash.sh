#!/bin/bash

dir=~/Desktop/ITMO-Operational-Systems-labs-4-sem/Labs/Lab4/task1

if [[ $# > 1 ]]; 
then
    echo "Too many arguments"
    exit 1
fi

if [[ $# < 1 ]]; 
then
    echo "Too few arguments"
    exit 1
fi

if [[ ! -f "$dir/$1" ]]; 
then
    echo "File not found"
    exit 1
fi

if [[ ! -e "$dir/.trash" ]];
then
    mkdir "$dir/.trash"
fi

value=1
while [[ -e "$dir/.trash/$1$value" ]]; do
    value=$(($value + 1))
done

ln "$dir/$1" "$dir/.trash/$1$value"

echo $(readlink -f $dir/$1) $1$value  >> "$dir/.trash.log"
rm "$dir/$1"
