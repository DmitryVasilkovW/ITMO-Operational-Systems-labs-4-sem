#!/bin/bash

dataDir=~/Desktop/ITMO-Operational-Systems-labs-4-sem/Labs/Lab5/firstExp/data
/home/bazis/Desktop/ITMO-Operational-Systems-labs-4-sem/Labs/Lab5/firstExp/first/mem.bash&pid0=$!

> $dataDir/data1
echo "TIME MEM VIRT RES SHR CPU FREE SWAP" >> $dataDir/data1

while true;
do
	line=$(top -p $pid0 -b -n 1 | head -8 | tail -n +8 )
	
	free=$(top -o %MEM -b -n 1 | head -4 | tail -n +4 | awk '{print ""$6""}')
	
	swap=$(top -o %MEM -b -n 1 | head -5 | tail -n +5 | awk '{print ""$5""}')
	
	line=$(echo -e $line | awk '{print ""$11" "$10" "$5" "$6" "$7" "$9""}')
	line=$(echo -e "$line $free $swap\n")
	
	echo $line >> $dataDir/data1
    sleep 1
done
