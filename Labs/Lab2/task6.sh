#!/bin/bash

maxN=0
maxP=0

for pid in $(ls /proc | grep -o '^[0-9]*' | sort -n); do
    if [[ -f /proc/$pid/status ]]; then
        mem=$(grep -i '^VmRSS:' /proc/$pid/status | awk '{print $2}')
        
        if [[ -z "$mem" ]]; then
            continue
        fi
        
        if [[ $mem -gt $maxN ]]; then
            maxN=$mem
            maxP=$pid
        fi 
    fi 
done

echo "process with PID "$pid" uses the most memory."
