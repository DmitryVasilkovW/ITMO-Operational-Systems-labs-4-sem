#!/bin/bash

gnome-terminal -e "bash -c 'top; read -n1'" & terminal_pid=$!

sleep 2

bash -c 'exec -a task1 sh ./task4loop.sh' & pid1=$!
sleep 1
bash -c 'exec -a task2 sh ./task4loop.sh' & pid2=$!
sleep 1
bash -c 'exec -a task3 sh ./task4loop.sh' & pid3=$!
sleep 1

renice +10 -p $pid3

timeout 10 cpulimit -p $pid1 -l 7

sleep 2

kill $pid3

sleep 4

kill $pid1
kill $pid2

pkill -HUP -P $terminal_pid
