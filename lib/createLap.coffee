getEndingTime = require "./getEndingTime"
hourMinuteToTime = require "./hourMinuteToTime"

module.exports = createLap = ( stopwatch, match = [], row ) ->
	parsedHour = match[ 1 ]
	parsedMinute = match[ 2 ]
	parsedText = match[ 3 ] ? ""
	parsedDurationHour = match[ 5 ] ? 0
	parsedDurationMinute = match[ 7 ] ? 0

	if stopwatch?.laps?.length
		startTime = getEndingTime stopwatch
	else
		startTime = hourMinuteToTime parsedHour, parsedMinute

	startTime: startTime
	text: parsedText
	duration: new Date 1970, 0, 1, parsedDurationHour, parsedDurationMinute
	row: row
	editor: stopwatch.editor
	stopwatch: stopwatch
