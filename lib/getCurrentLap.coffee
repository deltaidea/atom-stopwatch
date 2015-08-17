module.exports = getCurrentLap = ( stopwatch ) ->
	for lap in stopwatch.laps
		if not lap.text
			return lap

	null
