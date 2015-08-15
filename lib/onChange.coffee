{ Range } = require "atom"
createLap = require "./createLap"
decorateLapDuration = require "./decorateLapDuration"
decorateStopwatchHeader = require "./decorateStopwatchHeader"
getCurrentLap = require "./getCurrentLap"
incrementDuration = require "./incrementDuration"
lapToText = require "./lapToText"
parseLap = require "./parseLap"
updateStatusBar = require "./updateStatusBar"

module.exports = onChange = ( editor ) -> ->
	editor.stopwatches = []
	editor.stopwatchMarkers ?= []

	for oldMarker in editor.stopwatchMarkers
		oldMarker?.destroy?()
	editor.stopwatchMarkers = []

	currentRow = 0
	lastRowNumber = editor.getLastBufferRow()

	while currentRow <= lastRowNumber

		headerText = editor.lineTextForBufferRow currentRow

		if headerText.endsWith ".stopwatch"
			isHeaderLine = yes
			shouldAddToStatusBar = no
		else if headerText.endsWith ".stopwatch-with-status"
			isHeaderLine = yes
			shouldAddToStatusBar = yes

		if not isHeaderLine
			currentRow += 1
		else
			# For the next iteration.
			isHeaderLine = no

			if currentRow is lastRowNumber
				currentRowRange = new Range [ currentRow, 0 ],
					[ currentRow, headerText.length ]
				editor.setTextInBufferRange currentRowRange, headerText + "\n",
					undo: "skip"

			stopwatch =
				editor: editor
				title: headerText
				headerRow: currentRow
				laps: []
				shouldAddToStatusBar: shouldAddToStatusBar

			editor.stopwatches.push stopwatch

			decorateStopwatchHeader stopwatch

			currentRow += 1
			isFirstLine = yes

			loop
				currentRowText = editor.lineTextForBufferRow currentRow
				currentRowRange = new Range [ currentRow, 0 ], [ currentRow, currentRowText.length ]
				lapMatch = parseLap currentRowText

				if lapMatch or ( ( currentRowText is "" ) and isFirstLine )
					lap = createLap stopwatch, lapMatch, currentRow
					stopwatch.laps.push lap

					canonicalLapText = lapToText lap
					if canonicalLapText isnt currentRowText
						editor.setTextInBufferRange currentRowRange, canonicalLapText,
							undo: "skip"

					decorateLapDuration lap

				else
					break

				currentRow += 1
				isFirstLine = no
