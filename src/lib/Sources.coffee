Promise = require 'bluebird'
fs = require 'fs'

class Sources
	
	constructor: (@Database, @path) ->

		@tasks = null
		
	getTasks : () ->

		return new Promise (resolve, reject) =>

			if @tasks

				resolve @tasks

			else

				@load @path
				.then (tasks) ->

					resolve tasks

				.catch (error) ->

					reject error

	getTasksToRun : () ->

		return new Promise (resolve, reject) =>
			
			@getTasks()
			.then (tasks) =>
				
				toRun = []

				for task in tasks

					if !@Database.isInTasks(task.name)
						toRun.push task

				resolve toRun

			.catch (error) ->

				console.log 'Getting of tasks to run failed', error

				resolve []

	load : (path) ->

		return new Promise (resolve, reject) ->

			fs.readdir path, (error, files) ->

				if error

					reject error

				else

					parsed = []
					if files and files.length

						for file in files

							parsed.push {
								
								name : file
								path : path + '/' + file

							}

					resolve parsed


module.exports = Sources
