cleanHighlight = require "./cleanHighlight"
getCurrentTask = require "./getCurrentTask"
highlightTask = require "./highlightTask"

module.exports = updateHighlightedTasks = ->
	editors = atom.workspace.getTextEditors()
	for editor in editors
		if not editor?.stopwatches
			continue

		for stopwatch in editor.stopwatches
			task = getCurrentTask stopwatch
			if task
				highlightTask task
			else
				cleanHighlight stopwatch
