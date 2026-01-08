# Install quartify RStudio Snippets

Installs useful RStudio snippets for working with quartify. These
snippets help you quickly insert common structures when writing R
scripts that will be converted to Quarto documents.

## Usage

``` r
install_quartify_snippets(backup = TRUE, path = NULL)
```

## Arguments

- backup:

  Logical. If TRUE (default), creates a backup of your existing snippets
  file before modifying it.

- path:

  Character. Custom path for the snippets file. If NULL (default), uses
  the standard RStudio snippets location. For examples/tests, use
  tempdir().

## Value

Invisibly returns the path to the snippets file.

## Details

The following snippets are installed:

\- \*\*header\*\*: Insert a standard R script header with Title, Author,
Date, and Description - \*\*callout\*\*: Insert a Quarto callout
structure - \*\*mermaid\*\*: Insert a Mermaid diagram chunk -
\*\*tabset\*\*: Insert a tabset structure

The snippets are installed in your RStudio snippets file for R: -
Windows: \` - Mac/Linux: \`~/.config/rstudio/snippets/r.snippets\`

If you already have custom snippets, this function will append the
quartify snippets to your existing file. If quartify snippets were
previously installed, they will be automatically removed and replaced
with the new version.

The function will automatically open the snippets file in RStudio if
available. Simply save the file (Ctrl+S / Cmd+S) to reload the snippets
immediately without restarting RStudio. Then type the snippet name
(e.g., \`header\`) and press Tab to insert the template.

## Examples

``` r
if (interactive()) {
  # Install quartify snippets to RStudio
  install_quartify_snippets()

  # Install without backup
  install_quartify_snippets(backup = FALSE)
}

# For testing: install to temp directory
temp_snippets <- file.path(tempdir(), "r.snippets")
install_quartify_snippets(path = temp_snippets)
#> Created new snippets file: /tmp/RtmpkPU5oC/r.snippets
#> 
#> Snippets installed successfully!
#> If snippets do not appear, open the file below in RStudio and save it to reload snippets immediately.
#> /tmp/RtmpkPU5oC/r.snippets
#> 
#> Available snippets:
#>   - header  : R script header template
#>   - callout : Quarto callout structure
#>   - mermaid : Mermaid diagram chunk
#>   - tabset  : Tabset structure
#> 
#> Type the snippet name and press Tab to use it.
```
