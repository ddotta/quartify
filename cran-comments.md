## R CMD check results

0 errors | 0 warnings | 1 note

* This is a new release.

## Resubmission

This is a resubmission. In this version I have:

* Removed vignettes from package build (kept in repository for pkgdown documentation site)
* Quoted 'RStudio' in DESCRIPTION to address "possibly misspelled words"
* Converted non-ASCII characters in R/addins.R to Unicode escapes (\uxxxx)

The word "qmd" flagged as "possibly misspelled" is the standard file extension for Quarto markdown documents.

Note: The package documentation is available online at https://ddotta.github.io/quartify/ including the full getting-started guide that was previously in vignettes.

## Test environments

* local: Windows 11, R 4.3.0
* GitHub Actions (via usethis): 
  - macOS (latest), R-release
  - Windows (latest), R-release  
  - Ubuntu (latest), R-devel, R-release, R-oldrel

## Reverse dependencies

There are currently no downstream dependencies for this package.
