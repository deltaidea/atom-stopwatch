prefixDurationRegexp = /^\(((\d{1,}):)?(\d\d):(\d\d)\) /

module.exports = createStopwatch = ( editor, headerRow ) ->
	if not editor or not headerRow?
		return null

	headerText = editor.lineTextForBufferRow headerRow

	if headerText.endsWith ".stopwatch"
		shouldAddToStatusBar = no
		endPoint = -".stopwatch".length

	else if headerText.endsWith ".stopwatch-with-status"
		shouldAddToStatusBar = yes
		endPoint = -".stopwatch-with-status".length

	else
		return null

	match = headerText.match prefixDurationRegexp
	if match
		startPoint = match[ 0 ].length
	else
		startPoint = 0

	title = headerText.slice startPoint, endPoint

	editor: editor
	title: title
	headerText: headerText
	row: headerRow
	laps: []
	shouldAddToStatusBar: shouldAddToStatusBar
