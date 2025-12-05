# Demo script for rtoqmd_dir with Quarto book creation
# This example shows how to convert a directory of R scripts into a Quarto book

# Install and load quartify package
# install.packages("quartify")
library(quartify)

# Get path to example directory
example_dir <- system.file("examples", "book_example", package = "quartify")

# If running from source, use a temporary directory for the example
if (example_dir == "") {
  example_dir <- tempdir()
  dir.create(file.path(example_dir, "book_example"), showWarnings = FALSE)
  example_dir <- file.path(example_dir, "book_example")
  
  # Create sample R scripts
  writeLines('# Data Analysis\nlibrary(ggplot2)\ndata <- data.frame(x = 1:10, y = rnorm(10))\nggplot(data, aes(x, y)) + geom_point()',
             file.path(example_dir, "script1.R"))
  writeLines('# Statistical Models\ndata(mtcars)\nmodel <- lm(mpg ~ wt + hp, data = mtcars)\nsummary(model)',
             file.path(example_dir, "script2.R"))
}

# Basic usage: Convert all R scripts to .qmd
rtoqmd_dir(example_dir)

# Convert and render as a Quarto book with HTML output
output_dir <- file.path(example_dir, "documentation")
rtoqmd_dir(
  dir_path = example_dir,
  output_html_dir = output_dir,
  render = TRUE,
  author = "Your Name",
  book_title = "My R Scripts Documentation",
  open_html = TRUE  # Open the book in browser
)

# The function will:
# 1. Convert all R scripts to .qmd files
# 2. Create an index.qmd (home page)
# 3. Generate _quarto.yml with hierarchical structure
# 4. Render the book to HTML
# 5. Open index.html in your browser

# Customize the book appearance
rtoqmd_dir(
  dir_path = example_dir,
  output_html_dir = output_dir,
  render = TRUE,
  author = "Data Science Team",
  book_title = "Analysis Documentation",
  theme = "cosmo",
  code_fold = TRUE,
  number_sections = TRUE
)
