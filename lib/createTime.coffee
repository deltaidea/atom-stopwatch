module.exports = createTime = ( overrides ) ->
	now = new Date

	hour = overrides.hour ? now.getHours()
	minute = overrides.minute ? now.getMinutes()
	second = overrides.second ? now.getSeconds()

	new Date 1970, 0, 1, hour, minute, second
