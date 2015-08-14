module.exports = cleanHighlight = ( stopwatch ) ->
	for task in stopwatch.tasks
		if task.highlightMarker
			task.highlightMarker.destroy()
			task.highlightMarker = null
