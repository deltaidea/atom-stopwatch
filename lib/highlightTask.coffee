cleanHighlight = require "./cleanHighlight"

module.exports = highlightTask = ( task ) ->
	cleanHighlight task.planner

	marker = task.editor.markBufferPosition [ task.row, 0 ],
		invalidate: "touch"
		persistent: no

	decoration = task.editor.decorateMarker marker,
		type: "line"
		class: "planner-current-task"

	task.highlightMarker = marker
	task.editor.plannerMarkers.push marker
