module.exports = getCurrentLap = ( stopwatch ) ->
	firstLap = stopwatch.laps[ 0 ]

	if firstLap and not firstLap.text
		firstLap
	else
		null
