updateStatusBar = require "./updateStatusBar"

module.exports = addStatusBarTile = ( statusBar ) ->
	statusBar?.addLeftTile
		item: updateStatusBar.statusBarElement
		priority: 10
