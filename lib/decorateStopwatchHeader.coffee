module.exports = decorateStopwatchHeader = ( stopwatch ) ->
	headerMarker = stopwatch.editor.markBufferPosition [ stopwatch.headerRow, 0 ],
		invalidate: "touch"
		persistent: no

	decoration = stopwatch.editor.decorateMarker headerMarker,
		type: "line"
		class: "stopwatch-header"

	stopwatch.editor.stopwatchMarkers.push headerMarker
