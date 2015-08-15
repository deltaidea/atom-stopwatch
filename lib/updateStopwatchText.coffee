getCurrentLap = require "./getCurrentLap"
headerToText = require "./headerToText"
lapToText = require "./lapToText"

module.exports = incrementDuration = ( stopwatch ) ->
	lap = getCurrentLap stopwatch

	if lap
		lapText = lap.editor.lineTextForBufferRow lap.row
		updatedLapText = lapToText lap
		if lapText isnt updatedLapText
			lapRowRange = [[ lap.row, 0 ], [ lap.row, lapText.length ]]
			lap.editor.setTextInBufferRange lapRowRange, updatedLapText, undo: "skip"


	headerText = stopwatch.headerText
	updatedHeaderText = headerToText stopwatch
	if headerText isnt updatedHeaderText
		stopwatch.headerText = updatedHeaderText
		rowRange = [[ stopwatch.row, 0 ], [ stopwatch.row, headerText.length ]]
		stopwatch.editor.setTextInBufferRange rowRange, updatedHeaderText, undo: "skip"
