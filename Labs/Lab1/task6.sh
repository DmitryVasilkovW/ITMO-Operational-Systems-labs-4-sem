#!/bin/bash


if [ -f /var/log/anaconda/X.log ]; then
    grep 'WARNING' /var/log/anaconda/X.log | sed 's/WARNING/Warning:/g' > full.log
    grep 'INFO' /var/log/anaconda/X.log | sed 's/INFO/Information:/g' >> full.log

    cat full.log
else
    echo "file /var/log/anaconda/X.log not found."
fi
