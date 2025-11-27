## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)


## ----eval=FALSE---------------------------------------------------------------
## # install.packages("devtools")
## devtools::install_github("ddotta/quartify")


## ----eval=FALSE---------------------------------------------------------------
## library(quartify)
## 
## # Convert an R script to a Quarto document and render to HTML
## rtoqmd("my_script.R", "my_document.qmd")
## 
## # Convert only, without rendering to HTML
## rtoqmd("my_script.R", "my_document.qmd", render = FALSE)


## ----eval=FALSE---------------------------------------------------------------
## # Creates: /path/to/my_analysis.qmd and /path/to/my_analysis.html
## rtoqmd("script.R", "/path/to/my_analysis.qmd")


## ----eval=FALSE---------------------------------------------------------------
## # If script.R is in /home/user/scripts/
## # Creates: /home/user/scripts/script.qmd and /home/user/scripts/script.html
## rtoqmd("/home/user/scripts/script.R")


## ----eval=FALSE---------------------------------------------------------------
## # Creates files in your current working directory
## rtoqmd("script.R", "output.qmd")


## -----------------------------------------------------------------------------
#| eval: false
#| echo: true
## iris %>%
##   # Select a column
##   select(Species)


## ----eval=FALSE---------------------------------------------------------------
## rtoqmd(
##   input_file = "my_script.R",
##   output_file = "my_document.qmd",
##   title = "My Analysis Report",
##   author = "Your Name",
##   format = "html"
## )


## ----eval=FALSE---------------------------------------------------------------
## # Get the example file path
## example_file <- system.file("examples", "example.R", package = "quartify")
## 
## # Convert it
## rtoqmd(
##   input_file = example_file,
##   output_file = "iris_analysis.qmd",
##   title = "Iris Dataset Analysis",
##   author = "Data Analyst"
## )


## ----eval=FALSE---------------------------------------------------------------
## library(dplyr)


## -----------------------------------------------------------------------------
#| eval: false
#| echo: true
## iris |>
##   count(Species)


## -----------------------------------------------------------------------------
#| eval: false
#| echo: true
## iris |>
##   filter(Species == "setosa")


## -----------------------------------------------------------------------------
#| eval: false
#| echo: true
## iris %>%
##   # Select a column
##   select(Species)


## ----eval=FALSE---------------------------------------------------------------
## # This will create both .qmd and .html files, then open the HTML
## rtoqmd(example_file, "iris_analysis.qmd")


## ----eval=FALSE---------------------------------------------------------------
## rtoqmd(example_file, "iris_analysis.qmd", render = FALSE)


## quarto render iris_analysis.qmd

## ----eval=FALSE---------------------------------------------------------------
## quarto::quarto_render("iris_analysis.qmd")

