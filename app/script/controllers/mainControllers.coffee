'use strict'

angular.module('mainApp.controllers', [
		'mainApp.services'
	]).controller 'headController', ($scope, mainService)->
		$scope.themeColor = "black"
		$scope.openBtn = 'btn-blue'
		$scope.isColor = false

		mainService.getColor (data)->
			$scope.allThemes = data

		mainService.getIcon (data)->
			$scope.app_icon = data

		mainService.getTheme (data)->
			$scope.theme = data

		$scope.changeThemes = (color)->
			$scope.themeColor = color
			$scope.isColor = false
			return

		$scope.showColor = ()->
			$scope.isColor = !$scope.isColor
			return

		return