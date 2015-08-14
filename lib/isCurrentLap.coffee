getEndingTime = require "./getEndingTime"
hourMinuteToTime = require "./hourMinuteToTime"

module.exports = isCurrentLap = ( lap ) ->
	currentTime = hourMinuteToTime()
	startTime = lap.startTime
	endingTime = getEndingTime lap

	if endingTime > startTime
		startTime <= currentTime < endingTime
	else
		# Lap duration surrounds midnight.
		startTime <= currentTime or currentTime < endingTime
