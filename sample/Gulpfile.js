var gulp = require('gulp'),
    sass = require('gulp-ruby-sass');

gulp.task('default', function () {
  return sass('./style.scss', {
    style: 'compressed',
    loadPath: [
      './bower_components/bootstrap-sass/assets/stylesheets'

    ]
  })
    .pipe(gulp.dest('.'));
});