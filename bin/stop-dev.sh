#!/usr/bin/env bash

# Stops the Docker Redis container from running
OUTPUT="$((docker stop redis) 2>&1)"
echo "Container \"$OUTPUT\" stopped."

# Stops the Docker express-hello-world container from running
OUTPUT="$((docker stop express-hello-world-1) 2>&1)"
echo "Container \"$OUTPUT\" stopped."

OUTPUT="$((docker stop express-hello-world-2) 2>&1)"
echo "Container \"$OUTPUT\" stopped."

OUTPUT="$((docker stop nginx-hello-world) 2>&1)"
echo "Container \"$OUTPUT\" stopped."

docker ps