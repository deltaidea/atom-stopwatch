getCurrentTask = require "./getCurrentTask"
timeRemaining = require "./timeRemaining"
timeToText = require "./timeToText"

statusBarElement = document.createElement "span"

updateStatusBar = ->
	editors = atom.workspace.getTextEditors()
	textList = []

	for editor in editors
		if not editor?.stopwatches
			continue

		for stopwatch in editor.stopwatches
			if not stopwatch.shouldAddToStatusBar
				continue

			task = getCurrentTask stopwatch
			if task
				textList.push "#{task.text} - #{timeToText ( timeRemaining task ), yes}"

	statusBarElement.textContent = textList.join ", "

updateStatusBar.statusBarElement = statusBarElement
module.exports = updateStatusBar
