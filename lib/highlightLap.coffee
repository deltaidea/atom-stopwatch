cleanHighlight = require "./cleanHighlight"

module.exports = highlightLap = ( lap ) ->
	cleanHighlight lap.stopwatch

	marker = lap.editor.markBufferPosition [ lap.row, 0 ],
		invalidate: "touch"
		persistent: no

	decoration = lap.editor.decorateMarker marker,
		type: "line"
		class: "stopwatch-current-lap"

	lap.highlightMarker = marker
	lap.editor.stopwatchMarkers.push marker
