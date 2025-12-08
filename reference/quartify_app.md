# Launch Quartify Shiny Interface

Opens the Quartify conversion interface in your default web browser.
This function provides the same interface as the RStudio add-in but
works in any R environment including Positron, VS Code, RStudio, or
command line. Unlike the add-in, this function requires you to manually
select input files using the file browser in the interface.

Launches a Shiny application for converting R scripts to Quarto
documents. Provides a user-friendly interface with options for single
file or batch processing.

## Usage

``` r
quartify_app(launch.browser = TRUE, port = NULL)

quartify_app(launch.browser = TRUE, port = NULL)
```

## Arguments

- launch.browser:

  Logical, whether to launch browser (default: TRUE)

- port:

  Integer, port number for the application (default: NULL for random
  port)

## Value

Invisibly returns NULL when the app is closed

Invisible NULL

## Examples

``` r
if (FALSE) { # \dontrun{
# Launch the Shiny app in browser (works in any IDE)
quartify_app()

# Use in Positron or VS Code
library(quartify)
quartify_app()

# Specify a port
quartify_app(port = 3838)
} # }
if (FALSE) { # \dontrun{
quartify_app()
} # }
```
