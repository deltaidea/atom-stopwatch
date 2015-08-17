timeToText = require "./timeToText"
getDuration = require "./getDuration"

module.exports = lapToText = ( lap, returnAsParts = no ) ->
	useShortDurationInLaps = "01:20:30" is atom.config.get "stopwatch.useShortDurationInLaps"
	showSplitTime = atom.config.get "stopwatch.showSplitTime"

	if showSplitTime
		time = getDuration lap.stopwatch, lap
	else
		time = lap.duration

	parts =
		prefix: "  * "
		duration: "#{timeToText time, not useShortDurationInLaps}"
		text: "#{lap.text}"

	if returnAsParts
		parts
	else
		parts.prefix + parts.duration + parts.text
