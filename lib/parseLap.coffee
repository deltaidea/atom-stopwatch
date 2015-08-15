# ["  * 20 hours 31 minutes 1 second foo",
# " 20 hours", "20",
# " 31 minutes", "31",
# " 1 second", "1",
# " foo"]
lapReadableRegexp = /^  \*( (\d{1,}) hours?)?( (\d{1,2}) minutes?)?( (\d{1,2}) seconds?)?(.*)$/i

# ["  * 20:31:01 bar",
# "20",
# "31",
# ":01", "01",
# " bar"]
lapShortRegexp = /^  \* (\d{1,}):(\d{1,2})(:(\d{1,2}))?(.*)$/

module.exports = parseLap = ( str ) ->
	match = str.match lapReadableRegexp
	if match?[ 2 ] or match?[ 4 ] or match?[ 6 ]
		hours: match[ 2 ]
		minutes: match[ 4 ]
		seconds: match[ 6 ]
		text: match[ 7 ]

	else
		match = str.match lapShortRegexp
		if match
			hours: match[ 1 ]
			minutes: match[ 2 ]
			seconds: match[ 4 ]
			text: match[ 5 ]

		else
			null
