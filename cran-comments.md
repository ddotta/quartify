## R CMD check results

0 errors ✔ | 0 warnings ✔ | 1 note ✖

There was 1 NOTE:

```
checking for future file timestamps ... NOTE
  unable to verify current time
```

This NOTE is a known issue with systems where the current time cannot be verified and is not a concern for CRAN submission.

## First Submission - Version 1.0.0

This is the first CRAN submission of quartify.

## CRAN Policy Compliance

All CRAN policies have been addressed:

* **Interactive Functions**: Shiny apps (`quartify_app()`, `quartify_app_web()`) use `if(interactive()){}` in examples instead of `\dontrun{}`

* **Console Output**: Replaced all `cat()` calls with `message()` in `rtoqmd_dir.R` to allow suppression via `suppressMessages()`

* **Working Directory Management**: All `setwd()` calls immediately followed by `on.exit(setwd(old_wd), add = TRUE)` to ensure restoration even on error (in `rtoqmd.R`, `rtoqmd_dir.R`, `quartify_app_web.R`)

* **File Writing**: 
  - `install_quartify_snippets()` no longer writes to home directory by default in examples
  - Added `path` parameter for custom file location
  - Examples write to `tempdir()` for testing
  - Interactive examples properly wrapped in `if(interactive())`

* **Path Handling**: Fixed tilde (~) expansion with `path.expand()` for all file paths

The word "qmd" in DESCRIPTION is the standard file extension for Quarto markdown documents.

Package documentation is available at https://ddotta.github.io/quartify/

## Test environments

* local: Windows 11, R 4.3.0
* GitHub Actions (via usethis): 
  - macOS (latest), R-release
  - Windows (latest), R-release  
  - Ubuntu (latest), R-devel, R-release, R-oldrel

## Reverse dependencies

There are currently no downstream dependencies for this package.
