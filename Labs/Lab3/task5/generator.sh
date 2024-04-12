#!/bin/bash

while true;
do
	read line
	echo "$line" >> pipe

	if [[ "$line" == "QUIT" ]];
	then
		echo "Finish!"
		exit 0
	fi

	if [[ "$line" != "+" && "$line" != "*" && "$line" != "-" && "$line" != [0-9]* ]];
	then
		echo -e "\033[2K\033[1A\033[2K\033[1A\033[2K\033[1A"
		echo "Error command: generator and handler"
		echo "Error: handler your input: $line"
		echo "You can enter: (+, *, -) or number"
		exit 1
	fi
done
