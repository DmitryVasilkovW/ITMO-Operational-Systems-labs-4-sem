#!/bin/bash

file="task2.txt"

ps -eo pid,cmd | grep "/sbin/" | awk '{print $1, $2}' > $file
