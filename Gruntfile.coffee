module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')
    watch:
      gruntfile:
        files: 'Gruntfile.coffee'
      jade:
        files: 'src/**/*.jade'
        tasks: 'jade:dist'
      sass:
        files: 'src/**/*.scss'
        tasks: ['sass:dist', 'autoprefixer:dist']
      options:
        livereload: true
    connect:
      server:
        options:
          base: '.tmp'
          useAvailablePort: true
    clean:
      server: '.tmp'
    jade:
      options:
        client: false
      dist:
        expand: true
        cwd: 'src'
        src: '**/*.jade'
        dest: '.tmp'
        ext: '.html'
    sass:
      options:
        bundleExec: true
      dist:
        expand: true
        cwd: 'src'
        src: ['**/*.scss', '!**/_*.scss']
        dest: '.tmp'
        ext: '.css'
    autoprefixer:
      dist:
        expand: true
        cwd: '.tmp'
        src: '**/*.css'
        dest: '.tmp'

  grunt.loadNpmTasks task for task of grunt.config.data.pkg.devDependencies when task != 'grunt'

  grunt.registerTask 'build', [
    'clean:server'
    'jade:dist'
    'sass:dist'
    'autoprefixer:dist'
  ]

  grunt.registerTask 'default', [
    'build'
    'connect'
    'watch'
  ]
  return
