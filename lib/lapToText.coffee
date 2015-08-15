timeToText = require "./timeToText"

module.exports = lapToText = ( lap, returnAsParts = no ) ->
	parts =
		prefix: "  * "
		duration: "#{timeToText lap.duration, yes}"
		text: "#{lap.text}"

	if returnAsParts
		parts
	else
		parts.prefix + parts.duration + parts.text
