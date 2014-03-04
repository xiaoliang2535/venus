#!/usr/bin/env coffee

express = require 'express'
route   = require './route'
config  = require '../config/server.conf.json'

# if "development" is process.env.NODE_ENV
	# config = __util.extends config, require '../config/server.conf.json'

app = express()
port = config.server.port
mock = __dirname + '/' + config.server.path.mock

app.use express.logger()
app.use express.directory  __dirname + '/' + config.server.path.view
app.use express.static __dirname + '/' + config.server.path.view

route.route app, mock

module.exports = app