'use strict'

# BASE_PATH = 'http://localhost:8000/'
BASE_PATH = 'http://10.12.0.40:8000/'

angular.module 'mainApp.services', []
	.service 'mainService', ($http)->

		this.getColor = (callback)->
			$http.get "#{BASE_PATH}app/getColor"
				.success (data)->
					callback data
			return

		this.getIcon = (callback)->
			$http.get "#{BASE_PATH}app/getIcon"
				.success (data)->
					callback data
			return

		return