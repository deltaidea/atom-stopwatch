timeToText = require "./timeToText"

module.exports = lapToText = ( lap, returnAsParts = no ) ->
	parts =
		prefix: "  * "
		startTime: "#{timeToText lap.startTime}"
		startTimeDelimiter: " "
		text: "#{lap.text}"
		duration: ""

	if lap.duration
		parts.duration = timeToText lap.duration, yes

	if returnAsParts
		parts
	else
		parts.prefix + parts.startTime + parts.startTimeDelimiter + parts.text + parts.duration
