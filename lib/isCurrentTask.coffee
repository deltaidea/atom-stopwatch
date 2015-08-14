getEndingTime = require "./getEndingTime"
hourMinuteToTime = require "./hourMinuteToTime"

module.exports = isCurrentTask = ( task ) ->
	currentTime = hourMinuteToTime()
	startTime = task.startTime
	endingTime = getEndingTime task

	if endingTime > startTime
		startTime <= currentTime < endingTime
	else
		# Task duration surrounds midnight.
		startTime <= currentTime or currentTime < endingTime
