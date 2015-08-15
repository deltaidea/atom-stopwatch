module.exports = timeToText = ( time, readable = no ) ->
	if readable
		text = ""
		hours = time.getHours()
		minutes = time.getMinutes()
		seconds = time.getSeconds()
		if hours
			text += " #{hours} hour"
			if hours isnt 1
				text += "s"
		if minutes
			text += " #{minutes} minute"
			if minutes isnt 1
				text += "s"
		if ( seconds and atom.config.get "stopwatch.showSeconds" ) or not text
			text += " #{seconds} second"
			if seconds isnt 1
				text += "s"
		text.slice 1
	else
		paddedHour = ( "00" + time.getHours() ).slice -2
		paddedMinute = ( "00" + time.getMinutes() ).slice -2
		paddedSecond = ( "00" + time.getSeconds() ).slice -2
		if atom.config.get "stopwatch.showSeconds"
			"#{paddedHour}:#{paddedMinute}:#{paddedSecond}"
		else
			"#{paddedHour}:#{paddedMinute}"
