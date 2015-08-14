module.exports = getEndingTime = ( stopwatchOrLap ) ->
	if stopwatchOrLap.laps
		lap = stopwatchOrLap.laps[ stopwatchOrLap.laps.length - 1 ]
	else
		lap = stopwatchOrLap
	timeZoneOffset = +new Date 1970, 0, 1
	result = new Date ( +lap.startTime ) + ( +lap.duration ) - timeZoneOffset
	result.setDate 1
	result
