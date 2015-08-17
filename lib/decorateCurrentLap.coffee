getCurrentLap = require "./getCurrentLap"

module.exports = decorateCurrentLap = ( lap ) ->
	lapMarker = lap.editor.markBufferPosition [ lap.row, 0 ],
		invalidate: "touch"
		persistent: no

	decoration = lap.editor.decorateMarker lapMarker,
		type: "line"
		class: "stopwatch-current-lap"

	lap.editor.stopwatchMarkers.push lapMarker
