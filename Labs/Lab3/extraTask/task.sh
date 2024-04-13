#!/bin/bash

mkfifo pipe
bash generator.sh&a=$!
bash handler.sh $a
rm pipe
