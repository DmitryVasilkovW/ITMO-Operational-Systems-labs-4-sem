#!/bin/bash

file="task3.txt"

ps -o pid,start --sort=start | head -n 2 > $file
