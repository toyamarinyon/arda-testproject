gulp   = require 'gulp'
shell  = require 'gulp-shell'
coffee = require 'gulp-coffee'
sass   = require 'gulp-sass'
jade   = require 'gulp-react-jade'
webserver   = require 'gulp-webserver'

gulp.task 'default', ['build']
gulp.task 'build', [
  'build:ts'
  'build:coffee'
  'build:jade'
  'build:css'
]

gulp.task 'build:ts', shell.task [
  '$(npm bin)/tsc -d -m commonjs  --preserveConstEnums -t es5 --sourceMap --outDir lib src/entry.ts'
]

gulp.task 'build:coffee', ->
  gulp.src('src/**/*.coffee')
    .pipe(coffee())
    .pipe(gulp.dest('lib'))

gulp.task 'build:jade', ->
  gulp.src('src/**/*.jade')
    .pipe jade()
    .pipe(gulp.dest('lib'))

gulp.task 'build:css', ->
  gulp
    .src('src/styles/style.sass')
    .pipe sass
      indentedSyntax: true
      includePaths:[
        "node_modules/font-awesome/scss/",
        "node_modules/bootstrap-sass/assets/stylesheets/"
      ]
    .pipe(gulp.dest('public'))

gulp.task 'build:web', shell.task [
  '$(npm bin)/browserify -o public/bundle.js lib/index.js'
]

gulp.task 'watch', ['build'], ->
  gulp.watch 'src/**/*.coffee', ['build:coffee']
  gulp.watch 'src/**/*.ts', ['build:ts']
  gulp.watch 'src/**/*.jade', ['build:jade']
  gulp.watch 'src/styles/**/*.sass', ['build:css']
  gulp.watch 'lib/**/*', ['build:web']

gulp.task 'webserver', ->
  gulp.src './'
    .pipe webserver
      livereload: true
      host: '0.0.0.0'

gulp.task 'development', ['webserver','build','watch']
