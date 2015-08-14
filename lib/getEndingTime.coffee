module.exports = getEndingTime = ( plannerOrTask ) ->
	if plannerOrTask.tasks
		task = plannerOrTask.tasks[ plannerOrTask.tasks.length - 1 ]
	else
		task = plannerOrTask
	timeZoneOffset = +new Date 1970, 0, 1
	result = new Date ( +task.startTime ) + ( +task.duration ) - timeZoneOffset
	result.setDate 1
	result
