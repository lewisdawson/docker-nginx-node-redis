#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

docker build --rm=true -t lewdawson/nginx-hello-world $DIR/..

#docker rm express-hello-world