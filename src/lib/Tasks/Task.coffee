class Task
	
	constructor : () ->

		if @setup?

			@setup()

	run : () ->

		throw new Error 'Note has to have Task::run() method'
	
module.exports = Task
