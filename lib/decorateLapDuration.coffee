{ Range } = require "atom"
lapToText = require "./lapToText"

module.exports = decorateLapDuration = ( lap ) ->
	parts = lapToText lap, yes

	startPosition = parts.prefix.length
	endPosition = startPosition + parts.duration.length

	partRange = new Range [ lap.row, startPosition ], [ lap.row, endPosition ]

	partMarker = lap.editor.markBufferRange partRange,
		invalidate: "touch"
		persistent: no

	decoration = lap.editor.decorateMarker partMarker,
		type: "highlight"
		class: "stopwatch-lap-duration"

	lap.editor.stopwatchMarkers.push partMarker
