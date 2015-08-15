module.exports = createLap = ( stopwatch, match = [], row ) ->
	hour = match[ 2 ] ? 0
	minute = match[ 4 ] ? 0
	second = match[ 6 ] ? 0
	text = match[ 7 ] ? ""

	text: text
	duration: new Date 1970, 0, 1, hour, minute, second
	row: row
	editor: stopwatch.editor
	stopwatch: stopwatch
