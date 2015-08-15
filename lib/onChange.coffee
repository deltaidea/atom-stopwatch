createLap = require "./createLap"
createStopwatch = require "./createStopwatch"
decorateLapDuration = require "./decorateLapDuration"
decorateStopwatchHeader = require "./decorateStopwatchHeader"
lapToText = require "./lapToText"
parseLap = require "./parseLap"

module.exports = onChange = ( editor ) -> ->
	editor.stopwatches = []
	editor.stopwatchMarkers ?= []

	for oldMarker in editor.stopwatchMarkers
		oldMarker?.destroy?()
	editor.stopwatchMarkers = []

	currentRow = 0
	lastRowNumber = editor.getLastBufferRow()

	while currentRow <= lastRowNumber
		stopwatch = createStopwatch editor, currentRow

		if not stopwatch
			currentRow += 1
			continue

		editor.stopwatches.push stopwatch

		if currentRow is lastRowNumber
			currentRowRange = [[ currentRow, 0 ], [ currentRow, stopwatch.headerText.length ]]
			editor.setTextInBufferRange currentRowRange, "#{stopwatch.headerText}\n", undo: "skip"

		decorateStopwatchHeader stopwatch

		currentRow += 1
		isFirstLine = yes

		loop
			currentRowText = editor.lineTextForBufferRow currentRow
			currentRowRange = [[ currentRow, 0 ], [ currentRow, currentRowText.length ]]
			lapMatch = parseLap currentRowText

			if lapMatch or ( ( currentRowText is "" ) and isFirstLine )
				lap = createLap stopwatch, lapMatch, currentRow
				stopwatch.laps.push lap

				canonicalLapText = lapToText lap
				if canonicalLapText isnt currentRowText
					editor.setTextInBufferRange currentRowRange, canonicalLapText, undo: "skip"

				decorateLapDuration lap

			else
				break

			currentRow += 1
			isFirstLine = no
