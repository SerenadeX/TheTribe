var gulp = require('gulp')
var sass = require('gulp-sass')
var concat = require('gulp-concat')
var uglify = require('gulp-uglify')
var coffee = require('gulp-coffee')

gulp.task('default', function() {

})

gulp.task('build', function() {
  gulp.run('build:lib', 'build:app')
})

gulp.task('build:lib', function() {
  gulp.src(['assets/lib/jquery.min.js','assets/lib/angular.min.js','assets/lib/angular/*.js'])
    .pipe(concat('lib.min.js'))
    .pipe(gulp.dest('public'))
})

// gulp.task('build:modals', function() {
//   gulp.src('public/lib/js/modals/*.js')
//     .pipe(concat('modals.min.js'))
//     .pipe(gulp.dest('public'))
// })

gulp.task('build:app', function() {
  gulp.src(['assets/*.coffee'])
    .pipe(coffee())
    .pipe(concat('app.min.js'))
    .pipe(gulp.dest('public'))
})

gulp.task('sass', function() {
  gulp.src(['sass/base.scss'])
    .pipe(sass().on('error', function(err) {
      console.log("Error on sass:", err.message);
      }))
    .pipe(concat('style.css'))
    .pipe(gulp.dest('public'))

})

gulp.task('watch', function() {
  gulp.watch(['sass/**/*.scss', 'sass/*.scss'], ['sass'])
  gulp.watch(['assets/*.coffee'], ['build'])
})
