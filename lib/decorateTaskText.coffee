{ Range } = require "atom"
taskToText = require "./taskToText"

module.exports = decorateTaskText = ( task ) ->
	parts = taskToText task, yes

	startPosition = parts.prefix.length +
		parts.startTime.length +
		parts.startTimeDelimiter.length

	endPosition = startPosition + parts.text.length

	partRange = new Range [ task.row, startPosition ], [ task.row, endPosition ]

	partMarker = task.editor.markBufferRange partRange,
		invalidate: "touch"
		persistent: no

	decoration = task.editor.decorateMarker partMarker,
		type: "highlight"
		class: "planner-task-text"

	task.editor.plannerMarkers.push partMarker
