#!/bin/bash

echo ") with PID: $1"
kill -9 $(pgrep -f $1)
