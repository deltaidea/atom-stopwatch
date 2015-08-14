module.exports = hourMinuteToTime = ( customHour, customMinute ) ->
	currentTime = new Date
	currentHour = currentTime.getHours()
	currentMinute = currentTime.getMinutes()
	new Date 1970, 0, 1, customHour ? currentHour, customMinute ? currentMinute
