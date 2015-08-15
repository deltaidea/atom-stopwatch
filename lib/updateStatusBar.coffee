getCurrentLap = require "./getCurrentLap"
getDuration = require "./getDuration"
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
				lapText = "#{timeToText getDuration lap}"
				totalText = " (total: #{timeToText getDuration stopwatch})"
				textList.push "#{stopwatch.title} - #{lapText}#{totalText}"

		statusBarElement.textContent = textList.join ", "

updateStatusBar.statusBarElement = statusBarElement
module.exports = updateStatusBar
