#!/bin/bash

man bash | tr '[:upper:]' '[:lower:]' | tr -c '[:alpha:]' '\n' | awk 'length($0) >= 4' | sort | uniq -c | sort -nr | head -n 3
