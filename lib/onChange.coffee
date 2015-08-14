{ Range } = require "atom"
createLap = require "./createLap"
decorateStopwatchHeader = require "./decorateStopwatchHeader"
decorateLapText = require "./decorateLapText"
getCurrentLap = require "./getCurrentLap"
highlightLap = require "./highlightLap"
lapToText = require "./lapToText"
updateHighlightedLaps = require "./updateHighlightedLaps"
updateStatusBar = require "./updateStatusBar"

# ["  * 21:02 foo 10 hours 30 minutes", "21", "02", "foo", " 10 hours", "10", " 30 minutes", "30"]
lapRegexp = /^  \* (\d\d):(\d\d) (.*?)( (\d{1,2}) hours?)?( (\d{1,2}) minutes?)?$/i

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
				try
					currentRowText = editor.lineTextForBufferRow currentRow

					currentRowRange = new Range [ currentRow, 0 ],
						[ currentRow, currentRowText.length ]

					lapMatch = currentRowText.match lapRegexp

					if lapMatch or
					( currentRowText is "  " ) or
					( ( currentRowText is "" ) and isFirstLine )

						lap = createLap stopwatch, lapMatch, currentRow
						stopwatch.laps.push lap

						canonicalLapText = lapToText lap
						if canonicalLapText isnt currentRowText
							editor.setTextInBufferRange currentRowRange, canonicalLapText,
								undo: "skip"

						decorateLapText lap

						if lap is getCurrentLap stopwatch
							highlightLap lap

					else
						break
				catch
					break

				currentRow += 1
				isFirstLine = no

	updateStatusBar()
	updateHighlightedLaps()
