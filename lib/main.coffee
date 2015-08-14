addStatusBarTile = require "./addStatusBarTile"
onChange = require "./onChange"
updateHighlightedLaps = require "./updateHighlightedLaps"
updateStatusBar = require "./updateStatusBar"

module.exports = AtomStopwatch =
	activate: ->
		setInterval updateStatusBar, 2000
		setInterval updateHighlightedLaps, 2000

		atom.workspace.observeTextEditors ( editor ) ->
			editor.onDidStopChanging onChange editor

	consumeStatusBar: addStatusBarTile
