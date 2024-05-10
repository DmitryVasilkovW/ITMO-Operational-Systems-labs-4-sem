#!/bin/bash

dataDir=~/Desktop/ITMO-Operational-Systems-labs-4-sem/Labs/Lab5/firstExp/data
./mem2.bash&pid1=$!
> $dataDir/data2

echo "TIME MEM VIRT RES SHR CPU FREE SWAP" >> $dataDir/data2

while true;
do
	line=$(top -p $pid1 -b -n 1 | head -8 | tail -n +8 )
	
	free=$(top -o %MEM -b -n 1 | head -4 | tail -n +4 | awk '{print ""$6""}')
	
	swap=$(top -o %MEM -b -n 1 | head -5 | tail -n +5 | awk '{print ""$5""}')
	
	line=$(echo -e $line | awk '{print ""$11" "$10" "$5" "$6" "$7" "$9""}')
	line=$(echo -e "$line $free $swap\n")
	
	echo $line >> $dataDir/data2
	
	sleep 1
done
