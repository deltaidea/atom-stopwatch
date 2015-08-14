getCurrentTask = require "./getCurrentTask"
timeRemaining = require "./timeRemaining"
timeToText = require "./timeToText"

statusBarElement = document.createElement "span"

updateStatusBar = ->
	editors = atom.workspace.getTextEditors()
	textList = []

	for editor in editors
		if not editor?.planners
			continue

		for planner in editor.planners
			if not planner.shouldAddToStatusBar
				continue

			task = getCurrentTask planner
			if task
				textList.push "#{task.text} - #{timeToText ( timeRemaining task ), yes}"

	statusBarElement.textContent = textList.join ", "

updateStatusBar.statusBarElement = statusBarElement
module.exports = updateStatusBar
