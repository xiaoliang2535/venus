'use strict'

angular.module('mainApp.controllers', [
		'mainApp.services'
	]).controller 'headController', ($scope, mainService)->
		$scope.themeColor = "black"
		$scope.isColor = false

		mainService.getColor (data)->
			$scope.allThemes = data

		$scope.changeThemes = (color)->
			$scope.themeColor = color
			$scope.isColor = false
			return

		$scope.showColor = ()->
			$scope.isColor = !$scope.isColor
			return
		return

