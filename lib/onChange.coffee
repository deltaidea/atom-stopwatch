createLap = require "./createLap"
createStopwatch = require "./createStopwatch"
decorateLapDuration = require "./decorateLapDuration"
decorateStopwatch = require "./decorateStopwatch"
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

		currentRow += 1
		didFindRunningLap = no

		loop
			currentRowText = editor.lineTextForBufferRow currentRow
			if not currentRowText?
				break
			currentRowRange = [[ currentRow, 0 ], [ currentRow, currentRowText.length ]]
			lapMatch = parseLap currentRowText

			if lapMatch or ( ( currentRowText is "  " ) and not didFindRunningLap )
				if currentRowText is "  "
					didFindRunningLap = yes

				lap = createLap stopwatch, lapMatch, currentRow
				stopwatch.laps.push lap

				if not lap.text
					didFindRunningLap = yes

				canonicalLapText = lapToText lap
				if canonicalLapText isnt currentRowText
					editor.setTextInBufferRange currentRowRange, canonicalLapText, undo: "skip"

				decorateLapDuration lap

			else
				break

			currentRow += 1

		decorateStopwatch stopwatch
