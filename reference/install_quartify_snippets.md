# Install quartify RStudio Snippets

Installs useful RStudio snippets for working with quartify. These
snippets help you quickly insert common structures when writing R
scripts that will be converted to Quarto documents.

## Usage

``` r
install_quartify_snippets(
  backup = TRUE,
  path = file.path(tempdir(), "r.snippets")
)
```

## Arguments

- backup:

  Logical. If TRUE (default), creates a backup of your existing snippets
  file before modifying it.

- path:

  Character. Path for the snippets file. Defaults to writing in
  \`tempdir()\` to comply with CRAN policies. Provide an explicit path
  when you intentionally want to install into your RStudio snippets
  directory.

## Value

Invisibly returns the path to the snippets file.

## Details

The following snippets are installed:

\- \*\*header\*\*: Insert a standard R script header with Title, Author,
Date, and Description - \*\*callout\*\*: Insert a Quarto callout
structure - \*\*mermaid\*\*: Insert a Mermaid diagram chunk -
\*\*tabset\*\*: Insert a tabset structure

By default the snippets are written to a temporary file (inside
\`tempdir()\`) to comply with CRAN's restriction on writing to the
user's filespace during examples, vignettes, and tests. To install in
your actual RStudio snippets file, provide the explicit path via
\`path\`, for example: - Windows: \` - Mac/Linux:
\`~/.config/rstudio/snippets/r.snippets\`

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
#> Created new snippets file: /tmp/RtmpKh8wyC/r.snippets
#> 
#> Snippets installed successfully!
#> If snippets do not appear, open the file below in RStudio and save it to reload snippets immediately.
#> /tmp/RtmpKh8wyC/r.snippets
#> 
#> Available snippets:
#>   - header  : R script header template
#>   - callout : Quarto callout structure
#>   - mermaid : Mermaid diagram chunk
#>   - tabset  : Tabset structure
#> 
#> Type the snippet name and press Tab to use it.
```
