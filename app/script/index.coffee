'use strict'

# Ctrl = ($scope)->
# 	$scope.themeColor = "blue"
app = angular.module "mainApp", [
	'mainApp.controllers'
	# 'mainApp.services'
	'mainApp.directives'
	'mainApp.dragDirectives'
	'mainApp.maskDirectives'
	'mainApp.previewCanvas'
]

return
# app.config ($routerProvider)->