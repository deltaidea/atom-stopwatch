{ Range } = require "atom"
lapToText = require "./lapToText"

module.exports = incrementDuration = ( lap, ms = 1000 ) ->
	lap.duration = new Date +lap.duration + ms

	lapRow = lap.stopwatch.row + 1
	lapText = lap.editor.lineTextForBufferRow lapRow
	lapRowRange = new Range [ lapRow, 0 ], [ lapRow, lapText.length ]
	canonicalLapText = lapToText lap

	lap.editor.setTextInBufferRange lapRowRange, canonicalLapText,
		undo: "skip"
