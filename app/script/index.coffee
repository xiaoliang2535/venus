'use strict'

# Ctrl = ($scope)->
# 	$scope.themeColor = "blue"
app = angular.module "mainApp", [
	'mainApp.controllers'
	# 'mainApp.services'
	'mainApp.directives'
	'mainApp.dragDirectives'
	'mainApp.maskDirectives'
	'mainApp.previewDirectives'
	'mainApp.previewCanvas'
]

countdown = (num for num in [10..1])

return
# app.config ($routerProvider)->
