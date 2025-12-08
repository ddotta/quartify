# Install quartify RStudio Snippets

Installs useful RStudio snippets for working with quartify. These
snippets help you quickly insert common structures when writing R
scripts that will be converted to Quarto documents.

## Usage

``` r
install_quartify_snippets(backup = TRUE)
```

## Arguments

- backup:

  Logical. If TRUE (default), creates a backup of your existing snippets
  file before modifying it.

## Value

Invisibly returns the path to the snippets file.

## Details

The following snippets are installed:

\- \*\*header\*\*: Insert a standard R script header with Title, Author,
Date, and Description - \*\*callout\*\*: Insert a Quarto callout
structure - \*\*mermaid\*\*: Insert a Mermaid diagram chunk -
\*\*tabset\*\*: Insert a tabset structure

The snippets are installed in your RStudio snippets file for R
(\`~/.R/snippets/r.snippets\` on Unix/Mac or \`

If you already have custom snippets, this function will append the
quartify snippets to your existing file, avoiding duplicates.

After installation, restart RStudio or reload the window for the
snippets to become available. Then, simply type the snippet name (e.g.,
\`header\`) and press Tab to insert the template.

## Examples

``` r
if (FALSE) { # \dontrun{
# Install quartify snippets
install_quartify_snippets()

# Install without backup
install_quartify_snippets(backup = FALSE)
} # }
```
