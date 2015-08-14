module.exports = cleanHighlight = ( planner ) ->
	for task in planner.tasks
		if task.highlightMarker
			task.highlightMarker.destroy()
			task.highlightMarker = null
