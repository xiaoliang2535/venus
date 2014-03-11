'use strict'

# Ctrl = ($scope)->
# 	$scope.themeColor = "blue"
app = angular.module "mainApp", [
		'mainApp.controllers'
		# 'mainApp.services'
		'mainApp.directives'
	]
	.directive 'canvasmask', ($document)->
		restrict: 'ECA'
		terminal: true
		link: (scope, element, attrs)->
			# imageCanvas  = document.createElement 'canvas'
			imageCanvas = document.getElementById("test")
			imageContext = imageCanvas.getContext '2d'
			# iscope = attrs.iscope.split(",")

			width  = attrs.width  || 84
			height = attrs.height || 84
			imageCanvas.width  = width
			imageCanvas.height = height

			preImage = (url, cb)->
				img = new Image()
				img.src = url
				if img.complete
					cb.call img
					return
				img.onload = ()->
					cb.call img
				return

			# 内部组合
			# preImage attrs.imask, ()->
			# 	imageContext.drawImage this, 11, 11
			# 	imageContext.globalCompositeOperation = 'source-atop'

			preImage attrs.icon, ()->
				imageContext.drawImage this, 0, 0, width, height
				imageContext.globalCompositeOperation = 'source-atop'
				preImage attrs.imask, ()->
					imageContext.drawImage this, 12, 12
				imageContext.globalCompositeOperation = 'destination-atop'

				preImage attrs.ibase, ()->
					imageContext.drawImage this, 0, 0, width, height
					# imageContext.globalCompositeOperation = 'destination-over'

					# preImage attrs.iscope, ()->
					# 	imageContext.drawImage this, 0, 0, width, height

				# imageContext.globalCompositeOperation = 'source-atop'
			# 外部组合
			# preImage attrs.imask, ()->
			# 	imageContext.drawImage this, 11, 11
			# 	imageContext.globalCompositeOperation = 'source-out'





			return
# app.config ($routerProvider)->