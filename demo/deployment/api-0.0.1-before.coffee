deplify = require '../../dest/lib'

class ApiTask extends deplify.Tasks.NoteTask
	
	setup : () ->

		@addNote 'test note'
	
module.exports = ApiTask
