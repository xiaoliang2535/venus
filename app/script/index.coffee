'use strict'

# Ctrl = ($scope)->
# 	$scope.themeColor = "blue"
app = angular.module "mainApp", [
	'mainApp.controllers'
	# 'mainApp.services'
	'mainApp.directives'
	'mainApp.dragDirectives'
	'mainApp.maskDirectives'
]

return
# app.config ($routerProvider)->