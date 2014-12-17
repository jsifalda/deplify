gulp = require 'gulp'

Deplify = require '../dest/lib/Deplify'

deplify = new Deplify {
	database : __dirname + '/deplify-db.json'
	sources : __dirname + '/deployment'
}

gulp.task 'deploy-before', () ->

	deplify.run()

gulp.task 'deploy-after', () ->


gulp.task 'deploy', ['deploy-before', 'deploy-after']

gulp.task 'default', ['deploy']
