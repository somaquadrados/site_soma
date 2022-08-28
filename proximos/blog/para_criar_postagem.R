
## install.packages('blogdown')
getwd()

blogdown::new_post(
  title = "raster_I", # nombre del post
  subdir = getOption("content", "/blog"), # directorio 
  ext = ".Rmd" # formato de salida
)

