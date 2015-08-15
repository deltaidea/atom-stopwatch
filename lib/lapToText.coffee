timeToText = require "./timeToText"

module.exports = lapToText = ( lap, returnAsParts = no ) ->
	useShortDurationInLaps = "01:20:30" is atom.config.get "stopwatch.useShortDurationInLaps"

	parts =
		prefix: "  * "
		duration: "#{timeToText lap.duration, not useShortDurationInLaps}"
		text: "#{lap.text}"

	if returnAsParts
		parts
	else
		parts.prefix + parts.duration + parts.text
