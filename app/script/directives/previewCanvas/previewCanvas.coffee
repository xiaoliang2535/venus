'use strict'

angular.module('mainApp.previewCanvas', [])

.directive 'previewCanvas', ($document)->
	return (scope, element, attrs)->
		imageCanvas  = document.createElement 'canvas'
		imageContext = imageCanvas.getContext '2d'

		width  = element.prop('offsetWidth')
		height = element.prop('offsetHeight')
		imageCanvas.width  = width
		imageCanvas.height = height

		preImage = (url, cb)->
			img = new Image()
			img.src = url
			img.onload = ()->
				cb.call img, this
				element.attr "src", imageCanvas.toDataURL()
			return

		drawImage = (image, option, compos, cb)->
			preImage image, ()->
				imageContext.drawImage this, option.x, option.y, option.width, option.height
				# imageContext.drawImage this,
				if compos? and typeof compos isnt 'undefined'
					imageContext.globalCompositeOperation = compos
				if cb? and typeof cb isnt 'undefined'
					cb()
				return


		preImage attrs.bgimg, (bgimg)->
			switch attrs.pos
				when "left"   then x = 0
				when "right"  then x = width - bgimg.width
				when "center" then x = (width - bgimg.width)/2
			imageContext.drawImage this, x, 0, bgimg.width, imageCanvas.height
			preImage attrs.topimg, (topimg)->
				imageContext.drawImage this, 0, 0, width, 15

			# preImage attrs.topimg, (image)->
			# 	imageContext.drawImage this, 0, 0, width, image.width
			# imageContext.drawImage this, option.x, option.y, option.width, option.height
			# drawImage attrs.topimg, {x:0, y:0, width: width, height: 15}, null, null
			# element.attr "src", imageCanvas.toDataURL()

		#pw05bar.png
		#drawImage attrs.bgimg, {x:0, y:0, width:481, height: 378}, '', ()->

		# console.log element.prop('offsetWidth'), element.prop('clientWidth')
