getCurrentLap = require "./getCurrentLap"
headerToText = require "./headerToText"
lapToText = require "./lapToText"

module.exports = updateStopwatchText = ( stopwatch, forceUpdateAll ) ->
	if forceUpdateAll
		lap = stopwatch.laps[ 0 ]
	else
		lap = getCurrentLap stopwatch

	updateLapText = ( lap ) ->
		lapText = lap.editor.lineTextForBufferRow lap.row
		updatedLapText = lapToText lap
		if lapText isnt updatedLapText
			lapRowRange = [[ lap.row, 0 ], [ lap.row, lapText.length ]]
			lap.editor.setTextInBufferRange lapRowRange, updatedLapText, undo: "skip"

	if lap
		if forceUpdateAll or atom.config.get "stopwatch.showSplitTime"
			shouldUpdate = no
			for siblingLap in stopwatch.laps
				if siblingLap is lap
					shouldUpdate = yes
				if shouldUpdate
					updateLapText siblingLap
		else
			updateLapText lap

	headerText = stopwatch.headerText
	updatedHeaderText = headerToText stopwatch
	if headerText isnt updatedHeaderText
		stopwatch.headerText = updatedHeaderText
		rowRange = [[ stopwatch.row, 0 ], [ stopwatch.row, headerText.length ]]
		stopwatch.editor.setTextInBufferRange rowRange, updatedHeaderText, undo: "skip"
