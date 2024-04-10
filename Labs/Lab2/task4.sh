#!/bin/bash

file="task4.txt"
echo "" > $file

for pid in $(ls /proc | grep -o '[0-9]*' | sort -n); do
    if [ -d /proc/$pid ]; then
        ppid=$(grep -i "^PPid:" /proc/$pid/status | awk '{print $2}')
        sum=$(grep -i "^se.sum_exec_runtime" /proc/$pid/sched | awk '{print $3}')
        nr=$(grep -i "^nr_switches" /proc/$pid/sched | awk '{print $3}')
        
        if [ $nr -ne 0 ]; then
            art=$(echo "$sum / $nr" | bc -l)
        else
            art=0
        fi
        
        echo "PID=$pid : ParPID=$ppid : AvRuntime=$art" >> $file
    fi 
done

sort -t "=" -k4 -n $file -o $file
