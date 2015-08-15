getCurrentLap = require "./getCurrentLap"

module.exports = decorateStopwatchHeader = ( stopwatch ) ->
	headerMarker = stopwatch.editor.markBufferPosition [ stopwatch.row, 0 ],
		invalidate: "touch"
		persistent: no

	if getCurrentLap stopwatch
		className = "stopwatch-header-running"
	else
		className = "stopwatch-header"

	decoration = stopwatch.editor.decorateMarker headerMarker,
		type: "line"
		class: className

	stopwatch.editor.stopwatchMarkers.push headerMarker
