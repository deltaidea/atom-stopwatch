timeToText = require "./timeToText"

module.exports = taskToText = ( task, returnAsParts = no ) ->
	parts =
		prefix: "  * "
		startTime: "#{timeToText task.startTime}"
		startTimeDelimiter: " "
		text: "#{task.text}"
		duration: ""

	if task.duration
		parts.duration = timeToText task.duration, yes

	if returnAsParts
		parts
	else
		parts.prefix + parts.startTime + parts.startTimeDelimiter + parts.text + parts.duration
