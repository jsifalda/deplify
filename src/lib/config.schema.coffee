v = require 'validate-obj'

module.exports = {

	database : [v.required, v.isString]
	sources : [v.required, v.isString]
	
}
