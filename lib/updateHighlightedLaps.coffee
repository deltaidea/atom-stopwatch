cleanHighlight = require "./cleanHighlight"
getCurrentLap = require "./getCurrentLap"
highlightLap = require "./highlightLap"

module.exports = updateHighlightedLaps = ->
	editors = atom.workspace.getTextEditors()
	for editor in editors
		if not editor?.stopwatches
			continue

		for stopwatch in editor.stopwatches
			lap = getCurrentLap stopwatch
			if lap
				highlightLap lap
			else
				cleanHighlight stopwatch
