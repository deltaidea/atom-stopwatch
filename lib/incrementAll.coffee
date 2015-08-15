getCurrentLap = require "./getCurrentLap"
incrementDuration = require "./incrementDuration"
onChange = require "./onChange"
updateStatusBar = require "./updateStatusBar"

module.exports = incrementAll = ->
	editors = atom.workspace.getTextEditors()

	for editor in editors
		if not editor?.stopwatches
			continue

		for stopwatch in editor.stopwatches
			lap = getCurrentLap stopwatch
			if lap
				incrementDuration lap

		onChange( editor )()

	updateStatusBar()
