addStatusBarTile = require "./addStatusBarTile"
incrementAll = require "./incrementAll"
onChange = require "./onChange"
updateStopwatchText = require "./updateStopwatchText"

module.exports = AtomStopwatch =

	config:

		useShortDurationInLaps:
			title: "Lap duration format"
			description: "How do you want laps to look?"
			type: "string"
			enum: [ "01:20:30", "1 hour 20 minutes 30 seconds" ]
			default: "01:20:30"

		showSeconds:
			title: "Show seconds"
			description: "Display seconds (01:20:30) or not (01:20)"
			type: "boolean"
			default: yes

		showSplitTime:
			title: "Show split time instead of lap time"
			description: "Example: Lap times: 7:00, 7:00, 7:00. Split times: 7:00, 14:00, 21:00."
			type: "boolean"
			default: no

	activate: ->
		setInterval incrementAll, 1000

		atom.workspace.observeTextEditors ( editor ) ->
			editor.onDidChange onChange editor

		atom.config.onDidChange "stopwatch.showSplitTime", ( event ) ->
			if event.newValue isnt event.oldValue
				# Force update times in the text before `onChange` gets confused.
				for editor in atom.workspace.getTextEditors()
					if not editor?.stopwatches
						continue
					for stopwatch in editor.stopwatches
						updateStopwatchText stopwatch, yes

	consumeStatusBar: addStatusBarTile
