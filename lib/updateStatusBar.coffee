getCurrentLap = require "./getCurrentLap"
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

			lap = getCurrentLap stopwatch
			if lap
				textList.push "#{lap.text} - #{timeToText ( timeRemaining lap ), yes}"

	statusBarElement.textContent = textList.join ", "

updateStatusBar.statusBarElement = statusBarElement
module.exports = updateStatusBar
