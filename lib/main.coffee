addStatusBarTile = require "./addStatusBarTile"
onChange = require "./onChange"
updateHighlightedTasks = require "./updateHighlightedTasks"
updateStatusBar = require "./updateStatusBar"

module.exports = AtomStopwatch =
	activate: ->
		setInterval updateStatusBar, 2000
		setInterval updateHighlightedTasks, 2000

		atom.workspace.observeTextEditors ( editor ) ->
			editor.onDidStopChanging onChange editor

	consumeStatusBar: addStatusBarTile
