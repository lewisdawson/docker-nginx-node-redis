'use strict';

var express = require('express'),
    util = require('util'),
    uuid = require('node-uuid').v1(),
    app,
    server;

app = express();

app.get('/', function(req, res) {
    res.send(util.format('%s -- Hello World @ %s!', uuid, new Date().toISOString()));
});

server = app.listen(process.env.PORT || 8080, function() {
    var host = server.address().address,
        port = server.address().port;

    console.log('Express server listening at http://%s:%s', host, port);
});