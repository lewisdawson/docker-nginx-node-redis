#!/bin/bash

REDIS_IMAGE_NAME=redis
REDIS_PORT=6379

HELLO_WORLD_CONTAINER_NAME=express-hello-world
HELLO_WORLD_IMAGE_NAME=lewdawson/$HELLO_WORLD_CONTAINER_NAME
HELLO_WORLD_CONTAINER_NAME_1=$HELLO_WORLD_CONTAINER_NAME-1
HELLO_WORLD_CONTAINER_NAME_2=$HELLO_WORLD_CONTAINER_NAME-2

NGINX_CONTAINER_NAME=nginx-hello-world
NGINX_IMAGE_NAME=lewdawson/$NGINX_CONTAINER_NAME

OUTPUT="$((docker start $REDIS_IMAGE_NAME) 2>&1)"
if [[ "$OUTPUT" =~ "no such id" ]]; then
    # Run a Redis container for the first time. Note that this does NOT use a data volume for persistence beyond the life of the container
    # run -- run the Docker container
    # -d -- run container in background and print container id
    # --name -- gives the container the name "redis," which can be used to refer to the container from other commands/containers
    # -p -- Publish a container's port(s) to the host
    # redis -- the name of the image to run -- in this case, the docker hub image named "redis"
    docker run -d --name redis -p $REDIS_PORT:$REDIS_PORT redis
else
    echo "Container \"$OUTPUT\" started..."
fi

# Remove the previous container
docker rm $HELLO_WORLD_CONTAINER_NAME_1
#
docker run -d --name $HELLO_WORLD_CONTAINER_NAME_1 -p 8080:8080 --link $REDIS_IMAGE_NAME:$REDIS_IMAGE_NAME $HELLO_WORLD_IMAGE_NAME

# Remove the previous container
docker rm $HELLO_WORLD_CONTAINER_NAME_2
#
docker run -d --name $HELLO_WORLD_CONTAINER_NAME_2 -p 8090:8080 --link $REDIS_IMAGE_NAME:$REDIS_IMAGE_NAME $HELLO_WORLD_IMAGE_NAME

#
docker run -d --name $NGINX_CONTAINER_NAME -p 80:80 --link $HELLO_WORLD_CONTAINER_NAME_1:$HELLO_WORLD_CONTAINER_NAME_1 --link $HELLO_WORLD_CONTAINER_NAME_2:$HELLO_WORLD_CONTAINER_NAME_2 $NGINX_IMAGE_NAME

# Display the running Docker processes
docker ps