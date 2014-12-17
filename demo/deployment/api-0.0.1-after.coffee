deplify = require '../../dest/lib'

class ApiTask extends deplify.Tasks.NoteTask
	
	setup : () ->

		@addNote 'test after note'
	
module.exports = ApiTask
