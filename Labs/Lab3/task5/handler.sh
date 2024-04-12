#!/bin/bash

command="+"
result=1
check=1

echo "Mode plus: handler, Result: $result"

tail -f pipe |
while true;
do
        read line

	if [ $check -eq 1 ] && [[ "$line" == "+" || "$line" == "-" || "$line" == "*" ]]; then
		check=0
		echo -e "\033[2K\033[1A\033[2K"
	fi


        case "$line" in
		"-")
			command="$line"

			echo -e "\033[2K\033[1A\033[2K\033[1A\033[2K\033[1A"
			echo "Mode sub: handler, Result: $result"
		;;
                "+")
                        command="$line"

                        echo -e "\033[2K\033[1A\033[2K\033[1A\033[2K\033[1A"
                        echo "Mode plus: handler, Result: $result"
                ;;
                "*")
                        command="$line"

                        echo -e "\033[2K\033[1A\033[2K\033[1A\033[2K\033[1A"
                        echo "Mode multi: handler, Result: $result"
                ;;

		"QUIT")
                        killall tail
                        exit 0
                ;;
                [0-9]*)
			oldres=$result

                        case $command in
				"-")
					result=$(($result - $line))
					echo -e "\033[2K\033[1A\033[2K\033[1A\033[2K\033[1A"
					echo "Mode sub: handler, Result: $oldres - $line = $result"
				;;
                                "+")
                                        result=$(($result + $line))

                                        echo -e "\033[2K\033[1A\033[2K\033[1A\033[2K\033[1A"
                                        echo "Mode plus: handler, Result: $oldres + $line = $result"
                                ;;
                                "*")
                                        result=$(($result * $line))

                                        echo -e "\033[2K\033[1A\033[2K\033[1A\033[2K\033[1A"
                                        echo "Mode multi: handler, Result: $oldres * $line = $result"
                                ;;
                        esac
                ;;
                *)
                        killall tail
                        exit 1
                ;;
        esac
done
