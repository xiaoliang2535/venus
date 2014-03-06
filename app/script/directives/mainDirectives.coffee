'use strict'

angular.module 'mainApp.directives', []
	.directive 'draggable', ($document)->
		{
			restrict: 'ECA'
			terminal: true
			link: (scope, element, attrs)->
				startX = 0
				startY = 0
				x = 0
				y = 0

				mousemove = (event)->
					y = event.screenY - startY
					x = event.screenX - startX
					element.css {
						top: y + 'px'
						left: x + 'px'
					}

				mouseup = ()->
					element.css {
						top: 0
						left: 0
					}
					startX = startY = x = y = 0
					$document.unbind 'mousemove'#, mousemove
					$document.unbind 'mouseup'#, mouseup

				element.bind 'mousedown', (event)->
					# 传参数
					args = attrs.draggable.split(',')
					startX = event.screenX - x
					startY = event.screenY - y
					scope.openBtn = args[0]
					console.log scope, args, args[0]

					$document.bind 'mousemove', mousemove
					$document.bind 'mouseup', mouseup


				return
		}
return
