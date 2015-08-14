cleanHighlight = require "./cleanHighlight"
getCurrentTask = require "./getCurrentTask"
highlightTask = require "./highlightTask"

module.exports = updateHighlightedTasks = ->
	editors = atom.workspace.getTextEditors()
	for editor in editors
		if not editor?.planners
			continue

		for planner in editor.planners
			task = getCurrentTask planner
			if task
				highlightTask task
			else
				cleanHighlight planner
