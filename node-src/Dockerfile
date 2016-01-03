# Use the Docker Hub Node image
FROM node:0.10.41

ADD package.json /tmp/package.json
RUN cd /tmp && npm install
RUN mkdir -p /src && cp -a /tmp/node_modules /src/

WORKDIR /src
ADD . /src

EXPOSE 8080

CMD ["node", "/src/index.js"]