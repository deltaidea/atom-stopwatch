getCurrentLap = require "./getCurrentLap"
headerToText = require "./headerToText"
lapToText = require "./lapToText"

module.exports = incrementDuration = ( stopwatch, ms = 1000 ) ->
	lap = getCurrentLap stopwatch

	if not lap
		return

	lap.duration = new Date +lap.duration + ms

	lapText = lap.editor.lineTextForBufferRow lap.row
	lapRowRange = [[ lap.row, 0 ], [ lap.row, lapText.length ]]
	updatedLapText = lapToText lap
	lap.editor.setTextInBufferRange lapRowRange, updatedLapText, undo: "skip"

	headerText = stopwatch.headerText
	rowRange = [[ stopwatch.row, 0 ], [ stopwatch.row, headerText.length ]]
	updatedHeaderText = headerToText stopwatch
	stopwatch.editor.setTextInBufferRange rowRange, updatedHeaderText, undo: "skip"
