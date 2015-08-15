module.exports = createLap = ( stopwatch, match = {}, row ) ->
	hours = match.hours ? 0
	minutes = match.minutes ? 0
	seconds = match.seconds ? 0
	text = match.text ? ""

	text: text
	duration: new Date 1970, 0, 1, hours, minutes, seconds
	row: row
	editor: stopwatch.editor
	stopwatch: stopwatch
