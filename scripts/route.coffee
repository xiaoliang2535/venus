route = (app, path) ->

	fs = require 'fs'
	fileList = []

	walk = (path)->
		dirList = fs.readdirSync path

		dirList.forEach (item)->
			if fs.statSync(path + '/' + item).isFile()
				fileList.push(path + '/' + item)
			if fs.statSync(path + '/' + item).isDirectory()
				walk(path + '/' + item)
			return
		return
	walk path

	fileList.forEach (item)->
		mock  = require item
		mock.forEach (data)->
			if data.ver is "get"
				for url in data.url
					app.get url, (req, res)->
						res.send data.data
			else if data.ver is "post"
				for url in data.url
					app.post url, (req, res)->
						res.send data.data
			else
				console.log "enter error"
		return
	return
exports.route = route
