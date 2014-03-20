'use strict'

angular.module('mainApp.directives', [])
.directive 'menudrag', ($document)->
	return (scope, element, attrs)->
	# element.draggable = true

	# element.bind 'dragstart', (event)->
	# # event.dataTransfer.effectAllowed = 'move'
	# # console.log "dragstart"

	# element.bind 'dragend', (event)->
	# # console.log "dragend"

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
			scope.$apply ()->
			scope.openBtn = "btn-blue"
			startX = startY = x = y = 0
			$document.unbind 'mousemove'#, mousemove
			$document.unbind 'mouseup'#, mouseup

		element.bind 'mousedown', (event)->
			event.preventDefault()
			args = attrs.menudrag.split(',')
			scope.openBtn = args[0]
			scope.$apply ()->
				scope.openBtn = args[0]
			startX = event.screenX - x
			startY = event.screenY - y
			$document.bind 'mousemove', mousemove
			$document.bind 'mouseup', mouseup

