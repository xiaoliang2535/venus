'use strict'

angular.module('mainApp.dragDirectives', [])

.directive 'dragChange', ($document)->
	return (scope, element, attrs)->

		# # element.bind "mouseup", (e)->
		# # 	element.css {
		# # 		display: "block"
		# # 	}
		element.attr "draggable", false

		attrs.$observe "dragChange", (newValue)->
			element.attr "draggable", newValue


		startX = startY = topy = leftx = 0
		element.bind "dragstart", (e)->
			width = element.prop 'offsetWidth'
			height = element.prop 'offsetHeight'
			dragWrap = "<div class='drag-placeholder col' style='width:#{width}px; height:#{height}px'></div>"
			element.after(dragWrap)

			topy  = element.prop 'offsetTop'
			leftx = element.prop 'offsetLeft'

			# console.log topy, leftx

			startX = event.screenX - leftx
			startY = event.screenY - topy

			element.css {
				position: "absolute"
				top: topy + "px"
				left: leftx + "px"
			}

		element.bind "drag", (e)->

			elnext = element.next()

			leftx = event.screenX - startX
			topy = event.screenY - startY

			if leftx > (elnext.prop('offsetLeft') + elnext.prop('offsetWidth'))
				console.log "向右移"
				elnext.next().after(elnext)
			else if (leftx + element.prop('offsetWidth')) < (elnext.prop('offsetLeft'))
				console.log "向左移"
				elnext.after(elnext.before())
			else

			element.css {
				position: "absolute"
				top: topy + "px"
				left: leftx + "px"
			}

		element.bind "dragend", (e)->
			element.css {
				position: "static"
				top:  (element.next().prop 'offsetTop') + "px"
				left: (element.next().prop 'offsetLeft') + "px"
			}
			element.next().remove()

			#.addClass("hide")
			# elemClone = element.clone().removeClass("hide")

			# element.parent().append(elemClone)

			# elemClone.bind "mousedown", (e)->
			# 	event.preventDefault()

			# 	startX = event.screenX - x
			# 	startY = event.screenY - y
			# 	$document.bind 'mousemove', mousemove
			# 	$document.bind 'mouseup', mouseup

		# 	elemClone.triggerHandler("drag")



		# 	#
		# 	#.addClass("hide")
		# 	# element.after(element.clone()).addClass("hide")
		# 	# element.css {
		# 	# 	display: "none"
		# 	# }
		# 	# console.log event.screenX, event.screenY
		# 	# # datatran = e.dataTransfer
		# 	# # datatran.effectAllowed = 'all'
		# 	# # datatran.setData("text/plain","你好")

		# # 	return

		# element.bind "dragend", (e)->
		# 	console.log "end"

		# 	return

		# return