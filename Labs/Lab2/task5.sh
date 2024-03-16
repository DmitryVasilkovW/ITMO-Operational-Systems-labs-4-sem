#!/bin/bash

file="task5.txt"
tmp="tmp.txt"

echo "" > $file
echo "" > $tmp

for pid in $(ls /proc | grep -o '[0-9]*' | sort -n); do
    if [ -d /proc/$pid ]; then
        ppid=$(grep -i "^PPid:" /proc/$pid/status | awk '{print $2}')
        sum_exec_runtime=$(grep -i "^se.sum_exec_runtime" /proc/$pid/sched | awk '{print $3}')
        nr_switches=$(grep -i "^nr_switches" /proc/$pid/sched | awk '{print $3}')

        if [ $nr_switches -ne 0 ]; then
            art=$(echo "$sum_exec_runtime / $nr_switches" | bc -l)
        else
            art=0
        fi

        echo "PID=$pid : ParPID=$ppid : AvRuntime=$art" >> $tmp
    fi
done

sort -t "=" -k4 -n $tmp -o $file
rm $tmp

awk -F'[:=]' 'BEGIN{old_ppid=""; sum=0; count=0} {if ($4!=old_ppid && NR!=1) {print "Average_Running_Children_of_ParentID=" old_ppid " is " sum/count; sum=$6; count=1} else {sum+=$6; count++} print $0; old_ppid=$4} END{print "Average_Running_Children_of_ParentID=" old_ppid " is " sum/count}' $file > $tmp

mv $tmp $file
