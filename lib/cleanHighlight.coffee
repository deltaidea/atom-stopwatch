module.exports = cleanHighlight = ( stopwatch ) ->
	for lap in stopwatch.laps
		if lap.highlightMarker
			lap.highlightMarker.destroy()
			lap.highlightMarker = null
