getEndingTime = require "./getEndingTime"
hourMinuteToTime = require "./hourMinuteToTime"

module.exports = createTask = ( planner, match = [], row ) ->
	parsedHour = match[ 1 ]
	parsedMinute = match[ 2 ]
	parsedText = match[ 3 ] ? ""
	parsedDurationHour = match[ 5 ] ? 0
	parsedDurationMinute = match[ 7 ] ? 0

	if planner?.tasks?.length
		startTime = getEndingTime planner
	else
		startTime = hourMinuteToTime parsedHour, parsedMinute

	startTime: startTime
	text: parsedText
	duration: new Date 1970, 0, 1, parsedDurationHour, parsedDurationMinute
	row: row
	editor: planner.editor
	planner: planner
