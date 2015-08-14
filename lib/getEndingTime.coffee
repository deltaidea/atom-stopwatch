module.exports = getEndingTime = ( stopwatchOrTask ) ->
	if stopwatchOrTask.tasks
		task = stopwatchOrTask.tasks[ stopwatchOrTask.tasks.length - 1 ]
	else
		task = stopwatchOrTask
	timeZoneOffset = +new Date 1970, 0, 1
	result = new Date ( +task.startTime ) + ( +task.duration ) - timeZoneOffset
	result.setDate 1
	result
