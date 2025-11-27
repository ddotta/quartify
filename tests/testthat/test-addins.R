test_that("rtoqmd_addin exists and is a function", {
  expect_true(exists("rtoqmd_addin"))
  expect_type(rtoqmd_addin, "closure")
})

test_that("rtoqmd_addin has correct documentation", {
  # Check that the function is exported
  expect_true("rtoqmd_addin" %in% getNamespaceExports("quartify"))
})

test_that("rtoqmd function has code_fold parameter", {
  # Check function signature includes code_fold
  args_names <- names(formals(rtoqmd))
  expect_true("code_fold" %in% args_names)
})

test_that("rtoqmd generates YAML with code-fold option", {
  temp_r <- tempfile(fileext = ".R")
  temp_qmd <- tempfile(fileext = ".qmd")
  
  writeLines("x <- 1", temp_r)
  
  # Test with code_fold = TRUE
  rtoqmd(temp_r, temp_qmd, code_fold = TRUE)
  output <- readLines(temp_qmd)
  
  expect_true(any(grepl("code-fold: true", output)))
  
  # Test with code_fold = FALSE
  rtoqmd(temp_r, temp_qmd, code_fold = FALSE)
  output <- readLines(temp_qmd)
  
  expect_true(any(grepl("code-fold: false", output)))
  
  unlink(temp_r)
  unlink(temp_qmd)
})

test_that("rtoqmd default parameters are correct", {
  defaults <- formals(rtoqmd)
  
  expect_equal(defaults$title, "My title")
  expect_equal(defaults$author, "Your name")
  expect_equal(defaults$format, "html")
  expect_equal(defaults$render, TRUE)
  expect_equal(defaults$open_html, FALSE)
  expect_equal(defaults$code_fold, FALSE)
})

test_that("rtoqmd handles RStudio code sections correctly", {
  temp_r <- tempfile(fileext = ".R")
  temp_qmd <- tempfile(fileext = ".qmd")
  
  writeLines(c(
    "## Title 2 ####",
    "### Title 3 ====",
    "#### Title 4 ----",
    "x <- 1"
  ), temp_r)
  
  rtoqmd(temp_r, temp_qmd)
  output <- readLines(temp_qmd)
  
  expect_true(any(grepl("^## Title 2$", output)))
  expect_true(any(grepl("^### Title 3$", output)))
  expect_true(any(grepl("^#### Title 4$", output)))
  
  unlink(temp_r)
  unlink(temp_qmd)
})

test_that("rtoqmd preserves inline comments in code blocks", {
  temp_r <- tempfile(fileext = ".R")
  temp_qmd <- tempfile(fileext = ".qmd")
  
  writeLines(c(
    "iris %>%",
    "  # Select a column",
    "  select(Species)"
  ), temp_r)
  
  rtoqmd(temp_r, temp_qmd)
  output <- readLines(temp_qmd)
  
  # Inline comment should be in the code block
  expect_true(any(grepl("# Select a column", output)))
  
  unlink(temp_r)
  unlink(temp_qmd)
})
