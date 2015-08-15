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

			total = timeToText getDuration stopwatch
			currentLap = ""

			lap = getCurrentLap stopwatch
			if lap
				currentLap = " (#{timeToText getDuration lap})"
				textList.push "#{stopwatch.title} - #{total}#{currentLap}"

		statusBarElement.textContent = textList.join ", "

updateStatusBar.statusBarElement = statusBarElement
module.exports = updateStatusBar
