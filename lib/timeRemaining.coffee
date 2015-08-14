getEndingTime = require "./getEndingTime"
hourMinuteToTime = require "./hourMinuteToTime"

module.exports = timeRemaining = ( lap ) ->
	timeNow = hourMinuteToTime()
	endingTime = getEndingTime lap
	timeZoneOffset = +new Date 1970, 0, 1
	new Date endingTime - timeNow + timeZoneOffset
