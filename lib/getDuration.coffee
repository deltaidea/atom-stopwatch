module.exports = getDuration = ( stopwatchOrLap, upToThisLap ) ->
	totalDuration = +new Date 1970, 0, 1
	timeZoneOffset = +new Date 1970, 0, 1

	if stopwatchOrLap.duration
		totalDuration = stopwatchOrLap.duration
	else
		for lap in stopwatchOrLap.laps
			totalDuration += lap.duration - timeZoneOffset
			if lap is upToThisLap
				break

	new Date totalDuration
