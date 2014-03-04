'use strict'

BASE_PATH = 'http://localhost:8000/'

angular.module 'mainApp.services', []
	.service 'mainService', ($http)->

		this.getColor = (callback)->
			$http.get "#{BASE_PATH}app/getColor"
				.success (data)->
					callback data
			return
		return