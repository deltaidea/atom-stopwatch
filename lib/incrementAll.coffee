incrementDuration = require "./incrementDuration"
updateStatusBar = require "./updateStatusBar"
updateStopwatchText = require "./updateStopwatchText"

module.exports = incrementAll = ->
	editors = atom.workspace.getTextEditors()

	for editor in editors
		if not editor?.stopwatches
			continue

		for stopwatch in editor.stopwatches
			incrementDuration stopwatch
			updateStopwatchText stopwatch

	updateStatusBar()
