Somewhere = require 'somewhere'

class Database

	@COLLECTION_NAME : 'tasks'
	
	constructor: (path) ->
		
		@db = new Somewhere path

	getTasks : () ->

		return @db.find Database.COLLECTION_NAME

	isInTasks : (name) ->

		return @db.findOne(Database.COLLECTION_NAME, {name : name }).id?

	addTask : (name) ->

		@db.save Database.COLLECTION_NAME, {
			name : name
		}

		return @

	clear : () ->

		@db.clear()

		return @
	

module.exports = Database
