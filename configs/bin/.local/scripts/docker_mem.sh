#!/bin/sh
RUNNING_CONTAINER_NAME="$1"
OUTPUT_FILE="$HOME/.cache/${1}_memory_logs.txt"

while docker inspect --format '{{.State.Running}}' "$RUNNING_CONTAINER_NAME" &> /dev/null; do
    mem=$(docker stats --no-stream $RUNNING_CONTAINER_NAME | grep $RUNNING_CONTAINER_NAME | awk -v date="$(date +%T)" '{print date, $4}' | sed -e 's/MiB//g' )
    # echo "$mem">> $OUTPUT_FILE
    echo "$mem"
done
