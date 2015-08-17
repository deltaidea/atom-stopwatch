getDuration = require "./getDuration"
createTime = require "./createTime"

module.exports = createLap = ( stopwatch, match = {}, row ) ->
	hour = match.hours ? 0
	minute = match.minutes ? 0
	second = match.seconds ? 0
	text = match.text ? ""

	time = createTime { hour, minute, second }

	if atom.config.get "stopwatch.showSplitTime"
		previousTime = getDuration stopwatch
		timezoneOffset = +new Date 1970, 0, 1
		if time < previousTime
			previousTime = time
		duration = new Date time - previousTime + timezoneOffset
	else
		duration = time

	text: text
	duration: duration
	row: row
	editor: stopwatch.editor
	stopwatch: stopwatch
