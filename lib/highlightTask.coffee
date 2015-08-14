cleanHighlight = require "./cleanHighlight"

module.exports = highlightTask = ( task ) ->
	cleanHighlight task.stopwatch

	marker = task.editor.markBufferPosition [ task.row, 0 ],
		invalidate: "touch"
		persistent: no

	decoration = task.editor.decorateMarker marker,
		type: "line"
		class: "stopwatch-current-task"

	task.highlightMarker = marker
	task.editor.stopwatchMarkers.push marker
