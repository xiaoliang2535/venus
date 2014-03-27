'use strict'

angular.module('mainApp.previewDirectives', [])

.directive 'previewDemo', ($document)->
	{
		# # scope: true
		# template: '<div><canvas></canvas></div>'
		# replace: false
		# scope: {
		# 	sourceImg: "@bgimg"
		# }
		# terminal: true
		link: (scope, element, attrs)->
			imageCanvas = element.children()[0]
			imageContext = imageCanvas.getContext '2d'

			image = angular.element(element.children()[0])

			width  = imageCanvas.width
			height = imageCanvas.height

			preImage = (url, cb)->
				img = new Image()
				img.src = url
				img.onload = ()->
					cb.call img, this
					# image.attr "src", imageCanvas.toDataURL()
				return

			drawCenter = (src, posX, posY)->
				preImage src, (img)->
					sw = width - 2*posX
					sh = ((width - 2*posX)/ img.width)*img.height
					imageContext.drawImage this, posX, posY, sw, sh
				return

			drawIcon = (src, sx, sy, sw, sh, text)->
				preImage src, (img)->
					imageContext.drawImage this, sx, sy, sw, sh

					imageContext.fillStyle = "#fff"
					imageContext.font = "12px 'Helvetica Neue',Helvetica,Arial,sans-serif";
					imageContext.textBaseline = "top";

					imageContext.fillText(text, (parseInt(sx)+2), (parseInt(sh)+parseInt(sy)), sw)
					# imageContext.restore()


			preImage image.attr("bgimg"), (bgimg)->
				switch image.attr("pos")
					when "left"   then x = 0
					when "right"  then x = width - bgimg.width
					when "center" then x = (width - bgimg.width)/2
				imageContext.drawImage this, x, 0, bgimg.width, height
				if image.attr("pos") is "left"
					imageContext.fillStyle = "rgba(0, 0, 0, .8)"
					imageContext.fillRect 0, 0, width, height


				imgSpan = element.find("span")
				for i in imgSpan
					ielem = angular.element(i)
					drawCenter(ielem.attr("src"), ielem.attr("posX"), ielem.attr("posY"))

				imgUl = element.find("ul")
				for i in imgUl
					ielem = angular.element(i)
					posx = parseInt(ielem.attr("posX"))
					posy = parseInt(ielem.attr("posY"))
					margin = parseInt(ielem.attr("margin"))

					imgLi = ielem.find("li")
					# console.log imgLi
					for j, num in imgLi
						jelem = angular.element(j)
						sw = parseInt(jelem.attr("width"))
						sh = parseInt(jelem.attr("width"))
						sx = posx + num * (sw+margin)
						sy = posy
						# console.log jelem.attr("src"), sx, sy, jelem.attr("width")
						drawIcon(jelem.attr("src"), sx, sy, sw, sh, jelem.attr("text"))
				return


	}
