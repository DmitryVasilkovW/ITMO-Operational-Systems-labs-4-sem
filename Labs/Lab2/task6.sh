#!/bin/bash

PID=$(ps -eo pid --sort=-rss | head -n 2 | tail -n 1)

echo "process with PID "$PID" uses the most memory."

top -b -n 1 | head -n 10 | grep $PID
