gulp = require 'gulp'
coffee = require 'gulp-coffee'

gulp.task 'compile', () ->

	gulp.src __dirname + '/src/**/*.coffee'
	.pipe coffee()
	.pipe gulp.dest __dirname + '/dest'

gulp.task 'compile-watch', () ->

	gulp.watch __dirname + '/src/**/*.coffee', ['compile']

gulp.task 'default', ['compile', 'compile-watch']
