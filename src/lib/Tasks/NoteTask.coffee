Task = require './Task'

class NoteTask extends Task

	constructor : () ->

		@notes = []

		super
	
	addNote : (note) ->

		if typeof note != 'string'

			throw new Error 'Note has be string'

		@notes.push note
	
	run : () ->

		for note in @notes

			console.log 'NOTE:', note

module.exports = NoteTask
