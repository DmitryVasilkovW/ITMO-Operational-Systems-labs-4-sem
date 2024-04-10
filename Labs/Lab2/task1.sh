#!/bin/bash

User="root"
file="task1.txt"

ps -u $User > $file

num=$(($(wc -l < $file) - 1))

echo "amount of processes: $num" > $file

ps -u $User --no-headers -o pid,cmd >> $file
