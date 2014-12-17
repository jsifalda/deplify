Promise = require 'bluebird'

Database = require './Database'
Config = require './Config'
Sources = require './Sources'
Tasks = require './Tasks'
TasksRunner = require './TasksRunner'

class Deplify
	
	constructor: (options) ->

		@Config = new Config options
		@Config.validate true

		@Database = new Database @Config.get 'database'
		@Sources = new Sources @Database, @Config.get 'sources'

		@Tasks = Tasks
		@TasksRunner = new TasksRunner()

	run : (category) ->

		@Sources.getTasksToRun()
		.then (tasks) =>

			return new Promise (resolve, reject) =>

				timer = null
				onDone = () ->

					clearInterval timer
					resolve()

				timer = setInterval @getTimerCallback(tasks, onDone), 100

		.then () ->

			console.log 'All tasks processed!'

	getTimerCallback : (tasks, onDone) ->

		processing = false

		return checker = () =>
					
			if tasks and tasks.length

				if processing
					return

				task = tasks.shift()
				processing = true

				@TasksRunner.run task.name, task.path
				.then (result) =>
					
					if result
						
						console.log "Task #{ task.name } executed!"
						@Database.addTask task.name

					else
						console.log "Task #{ task.name } skipped!"

				.catch (error) ->

					console.log "Task #{ task.name } failed:"
					console.log error

				.finally () ->

					processing = false

			else

				onDone()

	
module.exports = Deplify
