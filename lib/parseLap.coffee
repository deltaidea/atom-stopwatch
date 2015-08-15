# ["  * 20 hours 31 minutes 1 second WOAH",
# " 20 hours", "20",
# " 31 minutes", "31",
# " 1 second", "1",
# " WOAH"]
lapRegexp = /^  \*( (\d{1,2}) hours?)?( (\d{1,2}) minutes?)?( (\d{1,2}) seconds?)?(.*)$/i

module.exports = parseLap = ( str ) ->
	match = str.match lapRegexp

	if match?[ 2 ] or match?[ 4 ] or match?[ 6 ]
		match
	else
		null
