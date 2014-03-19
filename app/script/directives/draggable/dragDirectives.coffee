'use strict'

angular.module('mainApp.directives', [])

.directive 'dragChange', ()->
	return (scope, element, attrs)->

		element.attr "draggable", false

		attrs.$observe "dragChange", (newValue)->
			element.attr "draggable", newValue


		element.bind "dragstart", (e)->
			# console.log 123
			datatran = e.dataTransfer
			datatran.effectAllowed = 'all'
			datatran.setData("text/plain","你好")

			return

		element.bind "dragend", (e)->
			# console.log 345

			return

		return

.directive 'dropWrap', ()->
	return (scope, element, attrs)->

		element.bind "drop", (e)->
			console.log "for drop"
			# datatran = e.dataTransfer
			# html = datatran.getData("text/plain")
			# console.log html
			# e.preventDefault()
			# e.stopPropagation()

		# onDrop = (e)->
		# 	console.log "for drop"

		return