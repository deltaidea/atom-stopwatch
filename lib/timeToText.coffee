module.exports = timeToText = ( time, readable = no ) ->
	if readable
		text = ""
		hours = time.getHours()
		minutes = time.getMinutes()
		if hours
			text += " #{hours} hour"
			if hours > 1
				text += "s"
		if minutes
			text += " #{minutes} minute"
			if minutes > 1
				text += "s"
		text
	else
		paddedHour = ( "00" + time.getHours() ).slice -2
		paddedMinute = ( "00" + time.getMinutes() ).slice -2
		"#{paddedHour}:#{paddedMinute}"
