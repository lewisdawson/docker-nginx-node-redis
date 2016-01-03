# nginx-node-redix

An example multi-tier [Docker](https://www.docker.com/) web application stack based loosely on the blog post found [here](http://anandmanisankar.com/posts/docker-container-nginx-node-redis-example/).

# Technologies

Details of the technologies that are used for this demonstration stack.

## Redis

Redis is used for the persistence layer of the stack. Note that, for this example, a data volume is *NOT* used. In English, this means that the data will not persist beyond the life of the container. This is fine for this example, but should not be used for any form of production-related development. More information about data volumes can be found [here](https://docs.docker.com/engine/userguide/dockervolumes/).

The default Docker hub Redis image is used for this example. More information about the image can be found [here](https://hub.docker.com/_/redis/).  