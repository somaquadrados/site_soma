#' ---
#' title: convert rmarkdown into pdf
#' author: Marília Melo Favalesso
#' date: 2021-03-24
#' ---

# packages
library(pagedown)
library(xaringan)
library(tidyverse)

# convert to pdf
setwd("C:/Users/mmfav/OneDrive/GitHub/soma quadrados/site_soma/content/talk/2021-10-13-curso-r-masto-py/clases/c1")
purrr::map(dir(pattern = ".Rmd$"), pagedown::chrome_print(timeout = 120,  options = list(transferMode = "ReturnAsStream")))

pagedown::chrome_print("clase_1.html", timeout = 120,  options = list(transferMode = "ReturnAsStream"))
# ---------------------------------end---------------------------------------- #


pagedown::chrome_print()

