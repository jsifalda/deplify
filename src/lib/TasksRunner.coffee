Promise = require 'bluebird'
readline = require "readline"

Task = require './Tasks/Task'

class TasksRunner
	
	constructor: () ->
	
	run : (name, path) ->

		return new Promise (resolve, reject) ->
			
			task = require path

			if task? and typeof task == 'function'

				task = new task()

				if !(task instanceof Task)

					throw new Error 'Task has to be instance of Task'

				rl = readline.createInterface(
					input: process.stdin
					output: process.stdout
				)
				
				rl.question "Do you want to run #{ name }? ", (answer) ->
					
					if answer.match(/^y(es)?$/i)
						result = task.run()

						if result instanceof Promise
						
							result
							.then () ->
								
								resolve true

							.catch (error) ->
								
								reject error

						else

							resolve true
					
					else

						resolve false
					
					rl.close()
	
module.exports = TasksRunner
