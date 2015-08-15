timeToText = require "./timeToText"
getDuration = require "./getDuration"

module.exports = headerToText = ( stopwatch, returnAsParts = no ) ->
	parts =
		duration: "(#{timeToText getDuration stopwatch}) "
		title: "#{stopwatch.title}"
		suffix: if stopwatch.shouldAddToStatusBar then ".stopwatch-with-status" else ".stopwatch"

	if returnAsParts
		parts
	else
		parts.duration + parts.title + parts.suffix
