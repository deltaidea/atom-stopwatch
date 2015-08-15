addStatusBarTile = require "./addStatusBarTile"
incrementAll = require "./incrementAll"
onChange = require "./onChange"

module.exports = AtomStopwatch =
	config:
		useShortDurationInLaps:
			title: "Lap duration format"
			description: "How do you want laps to look?"
			type: "string"
			enum: [ "01:20:30", "1 hour 20 minutes 30 seconds" ]
			default: "01:20:30"

	activate: ->
		setInterval incrementAll, 1000

		atom.workspace.observeTextEditors ( editor ) ->
			editor.onDidChange onChange editor

	consumeStatusBar: addStatusBarTile
