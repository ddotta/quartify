# Changelog

## quartify 1.1.1

### New Features

- **Roxygen2 Documentation Rendering**:
  - Roxygen2 documentation blocks (`#'`) are now automatically formatted
    into structured callouts resembling pkgdown reference pages
  - Rendered documentation includes: title, source line reference,
    description, usage with function signature, arguments, return value,
    details, and examples
  - LaTeX-style formatting is automatically converted to Markdown:
    - `\href{url}{text}` becomes `[text](url)`
    - `\code{text}` becomes `` `text` ``
    - `\strong{text}` becomes `**text**`
    - `\emph{text}` becomes `*text*`
  - Multi-line parameter descriptions and details are properly formatted
  - Custom sections (via `@section`) are supported and displayed

### Bug Fixes

- **CRAN Compliance**:
  - Added `Words: qmd` to DESCRIPTION to prevent spell-check warning
  - Added pattern `^CRAN_CHECKLIST_.*\.md$` to .Rbuildignore to exclude
    CRAN checklist files
- **Metadata Processing**: Fixed issue where empty lines and comments
  between metadata fields were not properly ignored, creating unwanted
  empty code chunks
- **Section Header Detection**: Improved regex pattern for hidden
  comments to correctly exclude RStudio section headers (`##`, `###`,
  `####`) from being filtered out

### Documentation

- Removed duplicate sections (Mermaid diagrams, Callouts) from
  advanced-features vignettes - these topics are now only in
  getting-started vignettes with correct syntax
- Added comprehensive documentation for roxygen2 rendering feature

## quartify 1.1.0

### New Features

- **Hidden Comments**:
  - Comments starting with `#` immediately followed by a non-space
    character (e.g., `#NOTE:`, `#TODO:`, `#DEBUG`) are now completely
    ignored during conversion
  - Allows including private development notes, debugging markers, and
    internal annotations in R scripts that won’t appear in rendered
    documentation
  - Useful for `#TODO:`, `#FIXME:`, `#NOTE:`, `#DEBUG`, `#INTERNAL:`,
    `#PRIVATE:`, `#HACK:`, `#OPTIMIZE:` markers
  - Only comments with a space after `#` (e.g., `# This is a comment`)
    are converted to text in the output

### Improvements

- **RStudio Snippets Installation**:
  - [`install_quartify_snippets()`](https://ddotta.github.io/quartify/reference/install_quartify_snippets.md)
    now uses correct paths for all platforms:
    - Windows: `%APPDATA%/RStudio/snippets`
    - Mac/Linux: `~/.config/rstudio/snippets`
  - Automatically removes and replaces old quartify snippets when
    re-running the function
  - Opens snippets file automatically in RStudio after installation
  - Snippets can be reloaded immediately by saving the file (Ctrl+S /
    Cmd+S) without restarting RStudio
  - Improved cross-platform compatibility for RStudio Desktop, Pro, and
    Server
- **Mermaid Diagram Syntax**:
  - Mermaid diagram content in R scripts now uses commented lines (with
    `#` prefix) to maintain valid R syntax
  - Example: `# flowchart TD`, `# A[Start] --> B[End]`
  - The `#` prefix is automatically removed during conversion to Quarto
  - Ensures R scripts remain valid and executable while containing
    Mermaid diagrams
  - Updated mermaid snippet to generate commented diagram lines

### Bug Fixes

- **Code Quality**: All non-ASCII characters removed from code to pass
  CRAN checks
  - Comments and messages in `R/snippets.R` converted to English

### Documentation

- Added comprehensive documentation for hidden comments feature in:
  - Function documentation
    ([`?rtoqmd`](https://ddotta.github.io/quartify/reference/rtoqmd.md))
  - Getting Started vignettes (EN and FR)
  - README files (EN and FR)
- Updated all Mermaid diagram examples to show commented syntax
- Clarified snippet installation process and immediate reload capability

## quartify 1.0.0

### CRAN Release

This is the first CRAN release of quartify! The package is now fully
compliant with CRAN policies.

### CRAN Compliance Fixes

- **Interactive Examples**:
  - Replaced `\dontrun{}` with `if(interactive()){}` in Shiny function
    examples
  - [`quartify_app()`](https://ddotta.github.io/quartify/reference/quartify_app.md)
    and
    [`quartify_app_web()`](https://ddotta.github.io/quartify/reference/quartify_app_web.md)
    examples now properly indicate interactive-only usage
  - Users can see examples are meant for interactive sessions, not
    scripts
- **Working Directory Management**:
  - Added immediate `on.exit(setwd(old_wd), add = TRUE)` after all
    [`setwd()`](https://rdrr.io/r/base/getwd.html) calls
  - Ensures working directory is always restored, even if function
    errors
  - Fixed in `rtoqmd.R`, `rtoqmd_dir.R`, and `quartify_app_web.R`
  - Removed manual [`setwd()`](https://rdrr.io/r/base/getwd.html)
    restoration in error handlers (now handled by
    [`on.exit()`](https://rdrr.io/r/base/on.exit.html))
- **Console Output**:
  - Replaced [`cat()`](https://rdrr.io/r/base/cat.html) with
    [`message()`](https://rdrr.io/r/base/message.html) in `rtoqmd_dir.R`
    per CRAN guidelines
  - Messages can now be suppressed with
    [`suppressMessages()`](https://rdrr.io/r/base/message.html) if
    needed
  - More R-like behavior for console output
- **File Writing**:
  - [`install_quartify_snippets()`](https://ddotta.github.io/quartify/reference/install_quartify_snippets.md)
    no longer writes to home directory by default in examples
  - Added `path` parameter to allow custom snippet file location
  - Examples now write to
    [`tempdir()`](https://rdrr.io/r/base/tempfile.html) for testing
  - Interactive examples properly wrapped in `if(interactive())`
- **Path Handling**:
  - Fixed tilde (~) path expansion issue in
    [`rtoqmd()`](https://ddotta.github.io/quartify/reference/rtoqmd.md)
  - Added [`path.expand()`](https://rdrr.io/r/base/path.expand.html) for
    `input_file`, `output_file`, and `output_html_file`
  - Quarto now receives absolute paths instead of tilde shortcuts
  - Resolves “No valid input files” error when using paths like
    “~/file.qmd”

### Documentation Improvements

- **apply_styler Parameter**:
  - Added comprehensive documentation in vignettes (EN and FR)
  - Clarified that `use_styler` must be TRUE for `apply_styler` to work
  - Added comparison table showing parameter combinations and results
  - Included workflow example showing safe preview before applying
    changes
  - Listed practical use cases for permanent code formatting
- **Mode Selection**:
  - Fixed missing mode selector in
    [`quartify_app()`](https://ddotta.github.io/quartify/reference/quartify_app.md)
  - Now matches
    [`rtoqmd_addin()`](https://ddotta.github.io/quartify/reference/rtoqmd_addin.md)
    with dynamic mode selection (single/directory)
  - Mode selector properly updates with language changes
- **Directory Selection UI**:
  - Fixed directory button display issue (no more “span…” in label)
  - Directory browser now opens correctly when selecting folders
  - Dynamic button rendering with proper language support

### Package Readiness

- **Version 1.0.0**: Stable release ready for CRAN submission
- **Zero R CMD check issues**: 0 errors, 0 warnings, 0 notes
- **Full CRAN policy compliance**: All guidelines followed
- **Comprehensive documentation**: Examples, vignettes, and help files
  complete
- **Tested across platforms**: Works on Windows, macOS, and Linux

## quartify 0.0.9

### New Features

- **Roxygen2 Documentation Support**:
  - Documentation blocks using roxygen2 syntax (`#'`) are now converted
    to callout-note blocks
  - Function name automatically extracted and added to callout title
    (e.g., “Documentation - add_numbers”)
  - All roxygen2 tags (`@param`, `@return`, `@examples`, etc.) preserved
    in callout content
  - Example file available: `inst/examples/example_roxygen.R`
  - Works with
    [`rtoqmd()`](https://ddotta.github.io/quartify/reference/rtoqmd.md),
    [`rtoqmd_dir()`](https://ddotta.github.io/quartify/reference/rtoqmd_dir.md)
    and all Shiny applications
    ([`rtoqmd_addin()`](https://ddotta.github.io/quartify/reference/rtoqmd_addin.md),
    [`quartify_app()`](https://ddotta.github.io/quartify/reference/quartify_app.md),
    [`quartify_app_web()`](https://ddotta.github.io/quartify/reference/quartify_app_web.md))
  - Updated test suite to verify roxygen2 conversion behavior

## quartify 0.0.8

### CRAN Submission Fixes

- **Final CRAN Compliance**:
  - Added `Language: en-US` field in DESCRIPTION to avoid “qmd”
    misspelling NOTE
  - Fixed last partial argument match: `render` → `render_html` in
    [`rtoqmd_dir()`](https://ddotta.github.io/quartify/reference/rtoqmd_dir.md)
  - Removed all non-ASCII characters: replaced accented characters (é
    → e) in French messages
  - Package now passes R CMD check with 0 errors, 0 warnings, 0 notes
- **Documentation Compliance**:
  - Added ‘Quarto’ in single quotes in DESCRIPTION per CRAN policy
  - Added `@return` documentation for all exported functions
    (`rtoqmd_addin`, `quartify_app`, `quartify_app_web`)
  - Changed `\dontrun{}` to `\donttest{}` for executable examples in
    [`rtoqmd()`](https://ddotta.github.io/quartify/reference/rtoqmd.md)
    and
    [`rtoqmd_dir()`](https://ddotta.github.io/quartify/reference/rtoqmd_dir.md)
  - Updated all examples to write to
    [`tempdir()`](https://rdrr.io/r/base/tempfile.html) instead of
    current directory
- **Code Quality**:
  - Replaced [`cat()`](https://rdrr.io/r/base/cat.html) calls with
    [`message()`](https://rdrr.io/r/base/message.html) for user-facing
    messages per CRAN guidelines
  - Fixed partial argument matching: changed all `render` arguments to
    `render_html` in Shiny apps
  - Fixed ERROR in R CMD check: changed non-executable example in
    [`rtoqmd_dir()`](https://ddotta.github.io/quartify/reference/rtoqmd_dir.md)
    back to `\dontrun{}`
- **User Interface Improvements**:
  - Integrated **shinyalert** package for better user notifications
  - Replaced `showNotification()` with elegant modal dialogs using
    `shinyalert()`
  - Success and error messages now displayed in centered modal windows
  - Bilingual support: titles and messages adapt to selected language
    (EN/FR)
  - Added `shinyalert` to package dependencies

### New Features

- **Code Quality Integration**: New `use_styler` and `use_lintr`
  parameters for code quality checks:
  - `use_styler`: Automatically format code using styler and show
    differences in tabsets
  - `use_lintr`: Run lintr quality checks and display issues in tabsets
  - Available in both
    [`rtoqmd()`](https://ddotta.github.io/quartify/reference/rtoqmd.md)
    and
    [`rtoqmd_dir()`](https://ddotta.github.io/quartify/reference/rtoqmd_dir.md)
    functions
  - Tabsets show Original Code, Styled Code (if changes), and Lint
    Issues (if found)
  - Only creates tabsets when there are actual issues or changes to
    report
  - Example file: `inst/examples/example_code_quality.R`
- **RStudio Snippets Installation**: New
  [`install_quartify_snippets()`](https://ddotta.github.io/quartify/reference/install_quartify_snippets.md)
  function to automatically install useful snippets:
  - `header`: R script header template with Title, Author, Date,
    Description
  - `callout`: Quarto callout structure
  - `mermaid`: Mermaid diagram chunk with options
  - `tabset`: Tabset structure with tabs

### Bug Fixes

- Fixed
  [`rtoqmd_addin()`](https://ddotta.github.io/quartify/reference/rtoqmd_addin.md)
  error when no document is active or unsaved (handled NULL/empty path
  cases)

### Documentation

- Updated vignettes to reference
  [`install_quartify_snippets()`](https://ddotta.github.io/quartify/reference/install_quartify_snippets.md)
  function
- Simplified tabset examples (removed “Data Structure” and “First Rows”
  tabs)
- Added snippet tips for callouts, mermaid diagrams, and tabsets in both
  English and French vignettes

## quartify 0.0.7

### New Features

- **Quarto Book Creation**:
  - `create_book` parameter now defaults to TRUE in
    [`rtoqmd_dir()`](https://ddotta.github.io/quartify/reference/rtoqmd_dir.md)
  - Automatically creates Quarto book structure with navigation and
    index
  - Books created in French now display “Sommaire” instead of “Table of
    contents”
  - Default output directory changed from `_documentation` to `_book`
- **Enhanced Shiny Applications**
  ([`rtoqmd_addin()`](https://ddotta.github.io/quartify/reference/rtoqmd_addin.md),
  [`quartify_app()`](https://ddotta.github.io/quartify/reference/quartify_app.md),
  [`quartify_app_web()`](https://ddotta.github.io/quartify/reference/quartify_app_web.md)):
  - **Code Organization**: Split monolithic `addins.R` (2185 lines) into
    3 separate files for better maintainability
  - **Harmonized UI**:
    - GENERATE button moved to top of page (below title bar) with
      centered hex logo
    - Consistent button placement across all 3 applications
    - Blue title bar styling (`#0073e6`) with white text
    - Removed Unicode symbols (checkmarks, arrows) for ASCII compliance
  - **Output Directory Selection**: Added selector for custom output
    directory in directory mode
  - **Create Book Checkbox**: New checkbox to enable/disable book
    creation in directory mode
  - **Multiple File Selection**: Changed from single to multiple file
    selection in file mode
  - **Conditional UI Elements**:
    - “Open .qmd file” checkbox only visible in file mode
    - “Open HTML file” checkbox only visible in file mode
    - Document title field hidden in directory mode (no title needed for
      books)
  - **Mode Labels**: Updated from “Un fichier” to “Un ou plusieurs
    fichiers” (FR) and “Single file” to “One or more files” (EN)
  - **Synchronized Loader**: Loader now waits for Quarto rendering to
    complete before disappearing (checks for index.html creation)
- **Web Application Improvements**
  ([`quartify_app_web()`](https://ddotta.github.io/quartify/reference/quartify_app_web.md)):
  - Document title field hidden in batch mode
  - Empty title automatically used in batch mode to avoid “My Analysis”
    in book chapters
  - Removed directory selection option (file upload only for web
    deployment)
  - Fixed ZIP download to include all generated files with proper
    structure:
    - `qmd/` folder contains all .qmd files and \_quarto.yml
    - `html/` folder contains all HTML files with complete directory
      structure
    - Includes all resources (CSS, JS, fonts, images) for standalone
      book viewing
  - Force synchronous rendering (`as_job = FALSE`) to ensure all files
    are generated before download
- **Improved File Management**:
  - Automatic cleanup of existing book files before regeneration
  - Temporary backup of `_quarto.yml` when rendering individual files
  - Prevents Quarto from detecting book structure during individual file
    renders
- **Enhanced User Experience**:
  - Changed loader background from opaque white to semi-transparent dark
    overlay
  - Better visual feedback during conversion process with synchronized
    loader
  - Success notifications with \[OK\] indicators
  - Empty document title in directory/batch mode prevents placeholder
    text in generated books
  - All text without accented characters for better compatibility

### Bug Fixes

- Fixed “Book chapter ‘index.qmd’ not found” error during directory
  conversion
- Fixed `index.html` generation issues in Quarto books
- Resolved conflicts between individual file rendering and book
  structure
- Corrected file path detection for HTML output in book projects
- Fixed premature loader dismissal when Quarto renders in background
- Fixed `index.html` missing from ZIP downloads in
  [`quartify_app_web()`](https://ddotta.github.io/quartify/reference/quartify_app_web.md):
  - Quarto book rendering now waits for completion before file
    collection
  - All HTML files including `index.html` are now properly included in
    downloads
  - ZIP structure preserves complete directory hierarchy for functional
    offline viewing
- Resolved non-ASCII character warnings in R CMD check

### Code Quality

- Removed all non-ASCII characters from source code for CRAN compliance
- Improved code organization with modular file structure
- Better maintainability with separated Shiny application files

### CI/CD

- Docker image build now triggered manually via `workflow_dispatch`
  instead of automatic on push
- Automatic push to DockerHub on main branch pushes
- Reduced unnecessary Docker builds during development

## quartify 0.0.6

### New Features

- **Web Deployment Version**
  ([`quartify_app_web()`](https://ddotta.github.io/quartify/reference/quartify_app_web.md)):
  - New web-friendly version designed for deployment on web servers
  - Uses file upload/download instead of local file system access
  - Deployed on SSP Cloud at <https://quartify.lab.sspcloud.fr/>
  - No R installation required - use directly in your browser
  - Upload your R script, configure options, and download generated .qmd
    and .html files
  - Perfect for sharing quartify with non-R users
- **Docker Support**:
  - Added Dockerfile for containerized deployment
  - Based on rocker/r-ver:4.4.1 with Quarto 1.4.549
  - Automated CI/CD with GitHub Actions
  - Docker images published to Docker Hub: `ddottaagr/quartify`
  - Includes Helm chart for Kubernetes deployment
- **UI Improvements**:
  - Changed “GO” button to “GENERATE” across all interfaces for clarity
  - Added bilingual support (EN/FR) for web version
  - Improved button styling and layout consistency

### Bug Fixes

- Fixed Quarto path issues in Docker environment
- Fixed image resource loading (hex logo and language flags) in web
  version
- Fixed relative path handling for `quarto_render()` to avoid output
  path errors

## quartify 0.0.5

### New Features

- **Source Line Numbers**:
  - Added `show_source_lines` parameter to
    [`rtoqmd()`](https://ddotta.github.io/quartify/reference/rtoqmd.md)
    to display original line numbers from source R script

  - When enabled, adds a comment at the beginning of each code chunk
    indicating the line range

  - Format: `# Lines X-Y` (English) or `# Lignes X-Y` (French)

  - Helps maintain traceability between documentation and source code

  - Added checkbox in RStudio add-in interface with EN/FR translations

  - Example output:

    ``` r
    # Lines 19-20
    iris |> 
      count(Species)
    ```

  - Completely automatic - no modification of R scripts required

  - Default is TRUE - enabled by default for better traceability
- **Standalone Shiny App**
  ([`quartify_app()`](https://ddotta.github.io/quartify/reference/quartify_app.md)):
  - New exported function
    [`quartify_app()`](https://ddotta.github.io/quartify/reference/quartify_app.md)
    for launching the conversion interface in any R environment
  - Works in **Positron**, **VS Code**, **RStudio**, terminal, or any
    IDE that supports R
  - Opens in default web browser with full-featured interface
  - Same functionality as RStudio add-in but IDE-agnostic
  - Perfect for users who don’t use RStudio but want the graphical
    interface
  - Usage:
    [`library(quartify); quartify_app()`](https://ddotta.github.io/quartify/)
  - Optional parameters:
    - `launch.browser = TRUE` (default) to open in browser
    - `port = NULL` (default) for automatic port selection

## quartify 0.0.4

### New Features

- **Custom HTML Output Path**:
  - Added `output_html_file` parameter to
    [`rtoqmd()`](https://ddotta.github.io/quartify/reference/rtoqmd.md)
    to specify custom HTML output location
  - Added `output_html_dir` parameter to
    [`rtoqmd_dir()`](https://ddotta.github.io/quartify/reference/rtoqmd_dir.md)
    to specify directory for batch HTML outputs
  - Added HTML file selector in RStudio add-in interface (optional
    field)
  - HTML files can now be saved in different location than .qmd files
  - Useful for organizing outputs in separate directories (e.g.,
    `docs/`, `html_output/`)
- **Mermaid Diagram Support**:
  - Added support for Mermaid diagrams to create flowcharts, sequence
    diagrams, and other visualizations

  - Use `#| mermaid` comment to start a Mermaid chunk in R scripts

  - Chunk options (lines starting with `#|`) are automatically converted
    to Quarto format (`%%|`)

  - Diagram content follows without `#` prefix and ends at empty line or
    comment

  - Example syntax:

    ``` r
    #| mermaid
    #| eval: true
    flowchart TD
        A[Start] --> B[Process]
        B --> C[End]
    ```

  - Converted to proper Quarto Mermaid chunks in .qmd output
- **Tabset Support**:
  - Added support for tabsets to organize related content in interactive
    tabs

  - Use `# tabset` to start a tabset container, then `# tab - Title` for
    each tab

  - Perfect for displaying alternative views, different analyses, or
    grouped visualizations

  - Tabsets automatically close at RStudio section headers

  - Example syntax:

    ``` r
    # tabset
    # tab - Summary Statistics
    # Here are the basic summary statistics:
    summary(iris)

    # tab - Data Structure
    # Let's examine the structure:
    str(iris)

    # tab - First Rows
    # Here are the first few rows:
    head(iris)
    ```

  - Converted to Quarto `{.panel-tabset}` format in .qmd output

  - See `inst/examples/example_tabset.R` for complete examples

### Bug Fixes

- Fixed issue where Quarto render command needed to run from .qmd file
  directory
- Improved path handling for custom HTML output locations with relative
  paths
- Added proper working directory management during Quarto rendering

## quartify 0.0.3

### CRAN Preparation

- Removed vignettes from package build (vignettes available online via
  pkgdown site)
- Quoted ‘RStudio’ in DESCRIPTION to address CRAN check notes
- Converted non-ASCII characters in R/addins.R to Unicode escapes
  (\uxxxx) for portability
- Enhanced online documentation with red-highlighted critical rules
  sections for better visibility
- Fixed R version consistency in CI/CD examples (updated to 4.5.1)

## quartify 0.0.2

### New Features

- **Improved RStudio Add-in Interface**:
  - File browsers for input and output file selection using shinyFiles
  - Language buttons (EN/FR) moved to title bar next to GO button
  - Input and output file selectors on the same row for better UX
  - Title, Author, and Theme widgets organized on the same line
  - Checkboxes organized in 2 columns for better layout
  - Automatic language detection based on R session locale preferences
  - Session cleanup: app properly stops when browser window is closed
- **Theme Support**:
  - Added HTML theme selection (25+ Quarto Bootswatch themes available)
  - Theme parameter in
    [`rtoqmd()`](https://ddotta.github.io/quartify/reference/rtoqmd.md)
    and
    [`rtoqmd_dir()`](https://ddotta.github.io/quartify/reference/rtoqmd_dir.md)
    functions
  - Theme selection in RStudio add-in interface
- **Language Support**:
  - Added `lang` parameter to
    [`rtoqmd()`](https://ddotta.github.io/quartify/reference/rtoqmd.md)
    function
  - Table of contents title adapts to language: “Sommaire” (FR) or
    “Table of contents” (EN)
  - Add-in automatically detects user’s R session language
- **Enhanced Section Title Handling**:
  - Flexible regex pattern accepts any RStudio section symbol (#, =, -)
  - Trailing symbols properly removed from section titles in output

### Improvements

- Updated interface labels:
  - “Render Html after conversion” (previously “Render after
    conversion”)
  - “Open Html output file after rendering” (previously “Open output
    file after rendering”)
  - “Number sections automatically (not needed if sections already
    numbered)” with helpful note
- Removed unsupported format option:
  - Format parameter now always uses “html” (PDF removed from add-in
    interface)
  - Updated all documentation to reflect HTML-only support

### Bug Fixes

- Fixed pkgdown configuration:
  - Added `aria-label` to home icon for accessibility
  - Added `rtoqmd_dir` to reference index

### Documentation

- Updated README (EN/FR) with:
  - Automatic language detection feature
  - File browser information
  - Theme selection examples
  - Complete list of available themes
- Enhanced vignettes with:
  - Multi-line Description field syntax
  - Comment conversion rules
  - Chunk splitting technique documentation
  - Theme usage examples

## quartify 0.0.1

### Initial Release

- First public release of quartify package

### Features

- **Automatic R to Quarto Conversion**: Convert R scripts (.R) to Quarto
  markdown documents (.qmd) with proper formatting
- **RStudio Code Sections Support**: Recognizes RStudio code section
  syntax (`####`, `====`, `----`) and converts them to hierarchical
  markdown headers with correct indentation levels (levels 2, 3, and 4)
- **Metadata Extraction**: Automatically extracts metadata from special
  comments in R scripts:
  - `# Title :` or `# Titre :` for document title
  - `# Author :` or `# Auteur :` for author name
  - `# Date :` for document date
  - `# Description :` for document description
  - Metadata found in scripts overrides function parameters
- **Bilingual RStudio Add-in**: Interactive Shiny interface with
  English/French language support for easy conversion through RStudio’s
  Addins menu
- **Comment Preservation**: Regular comments are converted to
  explanatory text, while inline comments within code blocks are
  preserved
- **Markdown Table Support**: Proper rendering of markdown tables in
  comments when lines are isolated with empty comment lines
- **Customizable Output**:
  - HTML output format
  - Control section numbering
  - Enable/disable code folding
  - Automatic HTML rendering and opening in browser
- **RStudio Snippet**: Included snippet for quick metadata header
  insertion in R scripts
- **Comprehensive Documentation**:
  - Bilingual vignettes (English/French)
  - Detailed README with examples
  - Complete function documentation

### Technical Details

- Generated Quarto documents include proper YAML headers with table of
  contents configuration
- Code chunks are non-executable by default (static documentation mode)
- HTML output uses `embed-resources: true` for self-contained files
- Roxygen comments (`#'`) are automatically ignored during conversion
