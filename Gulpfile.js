var compass = require('gulp-compass'),
  plumber = require('gulp-plumber'),
  browserSync = require('browser-sync').create(),
  cache = require('gulp-cache'),
  imagemin = require('gulp-imagemin')
  gulp = require('gulp');
  
  
gulp.task('browserSync', function() {
  browserSync.init({
   
    proxy: "http://massage/"
    
  })
})

gulp.task('compass', function() {
  gulp.src('./sass/**/*.scss')
    .pipe(plumber({
      errorHandler: function (error) {
        console.log(error.message);
        this.emit('end');
    }}))
    .pipe(compass({
      css: './css',
      sass: './sass',
      image: './img'
    }))
    .on('error', function(err) {
      // Would like to catch the error here 
    })
    .pipe(browserSync.reload({
      stream: true
    }))
    .pipe(gulp.dest('./temp'));
});	
gulp.task('images', function(){
  return gulp.src('./imgsrc/**/*.+(png|jpg|gif|svg)')
  .pipe(cache(imagemin())
  .pipe(gulp.dest('./img')))
});



gulp.task('watch', ['browserSync', 'compass'],  function(){
	gulp.watch('./sass/**/*.scss', ['compass']); 
	gulp.watch('./**/*.tpl', browserSync.reload); 
  gulp.watch('./js/**/*.js', browserSync.reload); 
})