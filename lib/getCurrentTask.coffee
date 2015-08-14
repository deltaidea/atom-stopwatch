isCurrentTask = require "./isCurrentTask"

module.exports = getCurrentTask = ( planner ) ->
	for task in planner.tasks
		if isCurrentTask task
			return task
	return null
