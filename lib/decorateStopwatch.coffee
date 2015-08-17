getCurrentLap = require "./getCurrentLap"
decorateCurrentLap = require "./decorateCurrentLap"

module.exports = decorateStopwatch = ( stopwatch ) ->
	headerMarker = stopwatch.editor.markBufferPosition [ stopwatch.row, 0 ],
		invalidate: "touch"
		persistent: no

	currentLap = getCurrentLap stopwatch

	if currentLap
		className = "stopwatch-header-running"
		decorateCurrentLap currentLap
	else
		className = "stopwatch-header"

	decoration = stopwatch.editor.decorateMarker headerMarker,
		type: "line"
		class: className

	stopwatch.editor.stopwatchMarkers.push headerMarker
