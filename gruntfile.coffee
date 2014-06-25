'use strict';

module.exports = (grunt) ->
	path = require 'path'

	grunt.initConfig
		pkg: grunt.file.readJSON('package.json')

		config:
			path:
				source: 'app'
				image: '<%= config.path.source %>/image'
				libary: '<%= config.path.source %>/vender'
				view: '<%= config.path.source %>/view'
				scripts: 'scripts'
				config: 'config'
				test: 'test'
				build: 'build'
		clean:
			build:
				files: [
					expand: true
					cwd: '<%= config.path.build %>'
					src: ['**']
					dot: true
				]
		coffee:
			build:
				files: [
					expand: true
					cwd: '<%= config.path.source %>/script'
					src: ['**/*.coffee']
					dest: '<%= config.path.build %>/<%= config.path.source %>/script'
					ext: '.js'
				]
		less:
			build:
				files: [
					expand: true
					cwd: '<%= config.path.source %>/style'
					src: ['**/*.less', "!**/*.mixin.less"]
					dest: '<%= config.path.build %>/<%= config.path.source %>/style'
					ext: '.css'
				]
		copy:
			html:
				files: [
					expand: true
					cwd: '<%= config.path.view %>'
					src: ['**/*.html']
					dest: '<%= config.path.build %>/<%= config.path.view %>/'
				]
			image:
				files: [
					expand: true
					cwd:'<%= config.path.image %>'
					src: ['**']
					dest: '<%= config.path.build %>/<%= config.path.image %>/'
				]
			lib:
				files: [
					expand: true
					cwd: '<%= config.path.libary %>'
					src: ['**']
					dest: '<%= config.path.build %>/<%= config.path.libary %>/'
				]
			js:
				files: [
					expand: true
					cwd: '<%= config.path.source %>'
					src: ['**/*.js']
					dest: '<%= config.path.build %>/<%= config.path.source %>'
				]

		cssmin:
			minify:
				files: [
					{
						expand: true
						cwd: '<%= config.path.build %>/<%= config.path.source %>/style'
						src: ['**/*.css', '!**/*.min.css']
						dest: '<%= config.path.build %>/<%= config.path.source %>/style'
						ext: '.css'
					}
				]

		uglify:
			options:
				mangle: false
				compress: true
				dot: false
				report: "gzip"
			build:
				files:[
					{
						expand: true
						cwd: "<%= config.path.build %>/<%= config.path.source %>/script"
						src: ["**/*.js", "!**/*.min.js"]
						dest: "<%= config.path.build %>/<%= config.path.source %>/script"
					}
				]

		watch:
			scripts:
				files: '**/*.coffee'
				tasks: ['coffee']
				options:
					livereload: true
			css:
				files: '**/*.less'
				tasks: ['less']
				options:
					livereload: true
			html:
				files: ['**/*.html', '!<%= config.path.build %>/<%= config.path.view %>/**/*.html']
				tasks: 'copy:html'
				options:
					livereload: true
			image:
				files: ['**/*.jpg', '**/*.png']
				tasks: 'copy:image'
			# js:
			# 	files: ['**/*.js', '!**/*.coffee']
			# 	tasks: 'copy:js'

		express:
			server:
				options:
					bases: ['<%= config.path.build %>']
					port: 8000
					server: path.resolve './scripts/server'

	require('load-grunt-tasks') grunt

	grunt.registerTask 'default', [
		'clean:build', 'coffee:build', 'less:build', 'copy', 'express', 'watch'
	]

	grunt.registerTask 'build', [
		'clean:build', 'coffee:build', 'less:build', 'copy', 'cssmin', 'uglify'
	]
	return
