#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

docker build --rm=true -t lewdawson/express-hello-world $DIR/..

#docker rm express-hello-world