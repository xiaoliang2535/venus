'use strict'

email = require('./models/emailTest');

module.exports = (app)->

	app.get "/app/sendEmail", email.send