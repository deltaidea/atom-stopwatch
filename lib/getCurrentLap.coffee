isCurrentLap = require "./isCurrentLap"

module.exports = getCurrentLap = ( stopwatch ) ->
	for lap in stopwatch.laps
		if isCurrentLap lap
			return lap
	return null
