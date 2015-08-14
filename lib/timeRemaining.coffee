getEndingTime = require "./getEndingTime"
hourMinuteToTime = require "./hourMinuteToTime"

module.exports = timeRemaining = ( task ) ->
	timeNow = hourMinuteToTime()
	endingTime = getEndingTime task
	timeZoneOffset = +new Date 1970, 0, 1
	new Date endingTime - timeNow + timeZoneOffset
