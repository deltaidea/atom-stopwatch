{ Range } = require "atom"
lapToText = require "./lapToText"

module.exports = decorateLapText = ( lap ) ->
	parts = lapToText lap, yes

	startPosition = parts.prefix.length +
		parts.startTime.length +
		parts.startTimeDelimiter.length

	endPosition = startPosition + parts.text.length

	partRange = new Range [ lap.row, startPosition ], [ lap.row, endPosition ]

	partMarker = lap.editor.markBufferRange partRange,
		invalidate: "touch"
		persistent: no

	decoration = lap.editor.decorateMarker partMarker,
		type: "highlight"
		class: "stopwatch-lap-text"

	lap.editor.stopwatchMarkers.push partMarker
