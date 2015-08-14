{ Range } = require "atom"
createTask = require "./createTask"
decoratePlannerHeader = require "./decoratePlannerHeader"
decorateTaskText = require "./decorateTaskText"
getCurrentTask = require "./getCurrentTask"
highlightTask = require "./highlightTask"
taskToText = require "./taskToText"
updateHighlightedTasks = require "./updateHighlightedTasks"
updateStatusBar = require "./updateStatusBar"

# ["  * 21:02 foo 10 hours 30 minutes", "21", "02", "foo", " 10 hours", "10", " 30 minutes", "30"]
taskRegexp = /^  \* (\d\d):(\d\d) (.*?)( (\d{1,2}) hours?)?( (\d{1,2}) minutes?)?$/i

module.exports = onChange = ( editor ) -> ->
	editor.planners = []
	editor.plannerMarkers ?= []

	for oldMarker in editor.plannerMarkers
		oldMarker?.destroy?()
	editor.plannerMarkers = []

	currentRow = 0
	lastRowNumber = editor.getLastBufferRow()

	while currentRow <= lastRowNumber

		headerText = editor.lineTextForBufferRow currentRow

		if headerText.endsWith ".planner"
			isHeaderLine = yes
			shouldAddToStatusBar = yes
		else if headerText.endsWith ".planner-no-status"
			isHeaderLine = yes
			shouldAddToStatusBar = no

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

			planner =
				editor: editor
				title: headerText
				headerRow: currentRow
				tasks: []
				shouldAddToStatusBar: shouldAddToStatusBar

			editor.planners.push planner

			decoratePlannerHeader planner

			currentRow += 1
			isFirstLine = yes

			loop
				try
					currentRowText = editor.lineTextForBufferRow currentRow

					currentRowRange = new Range [ currentRow, 0 ],
						[ currentRow, currentRowText.length ]

					taskMatch = currentRowText.match taskRegexp

					if taskMatch or
					( currentRowText is "  " ) or
					( ( currentRowText is "" ) and isFirstLine )

						task = createTask planner, taskMatch, currentRow
						planner.tasks.push task

						canonicalTaskText = taskToText task
						if canonicalTaskText isnt currentRowText
							editor.setTextInBufferRange currentRowRange, canonicalTaskText,
								undo: "skip"

						decorateTaskText task

						if task is getCurrentTask planner
							highlightTask task

					else
						break
				catch
					break

				currentRow += 1
				isFirstLine = no

	updateStatusBar()
	updateHighlightedTasks()
