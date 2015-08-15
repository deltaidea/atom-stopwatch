{ Range } = require "atom"
lapToText = require "./lapToText"

module.exports = incrementDuration = ( lap, inc = 1000 ) ->
	lap.duration = new Date +lap.duration + inc

	lapRow = lap.stopwatch.headerRow + 1
	lapText = lap.editor.lineTextForBufferRow lapRow
	lapRowRange = new Range [ lapRow, 0 ], [ lapRow, lapText.length ]
	canonicalLapText = lapToText lap

	lap.editor.setTextInBufferRange lapRowRange, canonicalLapText,
		undo: "skip"
