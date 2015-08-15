getCurrentLap = require "./getCurrentLap"

module.exports = incrementDuration = ( stopwatch, ms = 1000 ) ->
	lap = getCurrentLap stopwatch

	if not lap
		return

	lap.duration = new Date +lap.duration + ms
