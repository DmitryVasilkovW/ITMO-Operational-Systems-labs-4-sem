#!/bin/bash

mkfifo pipe
bash handler.sh&bash generator.sh
rm pipe
