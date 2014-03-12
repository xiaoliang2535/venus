'use strict'

angular.module 'maskDirectives', []

	.directive 'iconMask', ($document)->
		link: (scope, element, attrs)->

			imageCanvas  = document.createElement 'canvas'
			imageContext = imageCanvas.getContext '2d'

			width  = attrs.width  || 56
			height = attrs.height || 56
			imageCanvas.width  = width
			imageCanvas.height = height

			preImage = (url, cb)->
				img = new Image()
				img.src = url
				img.onload = ()->
					cb.call img
					element.attr "src", imageCanvas.toDataURL()
				return


			preImage attrs.src, ()->
				imageContext.drawImage this, 4, 4, 48, 48
				imageContext.globalCompositeOperation = 'destination-in'

				preImage attrs.mask, ()->
					imageContext.drawImage this, 0, 0, width, height
					imageContext.globalCompositeOperation = 'destination-over'

					preImage attrs.base, ()->
						imageContext.drawImage this, 0, 0, width, height
						imageContext.globalCompositeOperation = 'destination-atop'
						preImage attrs.shape, ()->
							imageContext.drawImage this, 0, 0, width, height
			return
	return



							# element.attr "src", imageCanvas.toDataURL()
				# imageContext.globalCompositeOperation = 'destination-over'

			# 内部组合

			# preImage attrs.icon, ()->
			# 	imageContext.drawImage this, 0, 0, width, height
			# 	imageContext.globalCompositeOperation = 'source-atop'
			# 	preImage attrs.imask, ()->
			# 		imageContext.drawImage this, 12, 12
			# 	imageContext.globalCompositeOperation = 'destination-atop'

					# preImage attrs.iscope, ()->
					# 	imageContext.drawImage this, 0, 0, width, height

				# imageContext.globalCompositeOperation = 'source-atop'
			# 外部组合
			# preImage attrs.imask, ()->
			# 	imageContext.drawImage this, 11, 11
			# 	imageContext.globalCompositeOperation = 'source-out'

 # var width  = img.offsetWidth;
 #      var height = img.offsetHeight;

 #      var mask = document.createElement('img');
 #      mask.src = img.getAttribute('data-mask');

 #      imagecanvas.width  = width;
 #      imagecanvas.height = height;

 #      imagecontext.drawImage(mask, 0, 0, width, height);
 #      imagecontext.globalCompositeOperation = 'source-atop';
 #      imagecontext.drawImage(img, 0, 0);

 #      img.src = imagecanvas.toDataURL();