#!/bin/bash

MEMORY_GROWTH_FACTOR=2 
MEMORY_WARNING_THRESHOLD=$((10 * 1024)) 
MEMORY_LIMIT=$((100 * 1024)) 
LOG_FILE="monitoring.log"

check_memory_growth()
{
    local pid=$1
    if ! kill -0 $pid 2>/dev/null;
    then
        return 
    fi
    local memory_usage=$(ps -p $pid -o rss=)
    local last_memory_usage=$(cat "/tmp/memory_usage_$pid" 2>/dev/null || echo 0)
    local growth=$((memory_usage - last_memory_usage))

    if [[ $growth -ge $((MEMORY_GROWTH_FACTOR * last_memory_usage)) ]];
    then
        echo "$(date +"%Y-%m-%d %H:%M:%S") Warning: Process $pid is consuming memory above the threshold" >> "$LOG_FILE"
    fi

    echo $memory_usage > "/tmp/memory_usage_$pid"
}

check_memory_limit() 
{
    local pid=$1
    if ! kill -0 $pid 2>/dev/null;
    then
        return  
    fi
    local memory_usage=$(ps -p $pid -o rss=)

    if [[ $memory_usage -gt $MEMORY_LIMIT ]];
    then
        echo "$(date +"%Y-%m-%d %H:%M:%S") Error: Process $pid has reached the memory limit and will be terminated" >> "$LOG_FILE"
        kill -9 $pid
    fi
}

while true;
do
    for pid in $(pgrep -f "loop.sh");
    do 
        check_memory_growth $pid
        check_memory_limit $pid
    done

    sleep 1 
done
