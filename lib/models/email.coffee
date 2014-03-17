'use strict'

nodemailer = require "nodemailer"

exports.send = (req, res)->

	console.log "start send ..."

	smtpTransport = nodemailer.createTransport "SMTP", {
		# service: "smtp.qq.com"
		# auth: {
		# 	user: "736909136@qq.com"
		# 	pass: "xiaoliang"
		# }
		host: "smtp.qq.com"
		secureConnection: true
		port: 465
		auth: {
			user: "736909136@qq.com"
			pass: "xiaoliang"
		}
	}

	# setup e-mail data with unicode symbols
	mailOptions = {
		from: "736909136@qq.com"
		to: "cxj_liang@126.com"
		sublect: "hello subject"
		text: "hello world"
		html: "<b>Hello world </b>"
	}

	smtpTransport.sendMail mailOptions, (error, response)->
		if error
			console.log error
		else
			console.log "Message sent: " + response.message
		console.log "send over"
		smtpTransport.close()

	###
	{ [Error: connect ECONNREFUSED]
	  code: 'ECONNREFUSED',
	  errno: 'ECONNREFUSED',
	  syscall: 'connect',
	  stage: 'init' }
	###

	# smtpTransport = nodemailer.createTransport "SMTP", {
	# 	host: "localhost"
	# 	maxConnections: 2
	# }

	return
