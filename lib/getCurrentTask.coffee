isCurrentTask = require "./isCurrentTask"

module.exports = getCurrentTask = ( stopwatch ) ->
	for task in stopwatch.tasks
		if isCurrentTask task
			return task
	return null
