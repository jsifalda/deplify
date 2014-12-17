v = require 'validate-obj'
_ = require 'underscore'

schema = require './config.schema'

class Config

	defaults = {

	}
	
	constructor: (options) ->

		@options = _.extend _.clone(defaults), options
	
	validate : (required = false) ->

		errors = v.hasErrors @options, schema

		if required and errors and errors.length

			throw new Error 'Missing fields in Deplify config: ' + JSON.stringify(errors)

		return errors

	get : (name) ->

		if name?

			return @options[name]

		return @options
	
module.exports = Config
