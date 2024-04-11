#!/bin/bash

dates=$(date '+%F|%T')

mkdir /home/bazis/Desktop/ITMO-Operational-Systems-labs-4-sem/Labs/Lab3/task1/test && { echo "catalog test was created successfully" > /home/bazis/Desktop/ITMO-Operational-Systems-labs-4-sem/Labs/Lab3/task1/report ; touch /home/bazis/Desktop/ITMO-Operational-Systems-labs-4-sem/Labs/Lab3/task1/test/$dates ; }
ping net_nikogo.ru || echo "${dates} ERROR HOST" >> /home/bazis/Desktop/ITMO-Operational-Systems-labs-4-sem/Labs/Lab3/task1/report
