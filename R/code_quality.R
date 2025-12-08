#' Check and Format Code with styler and lintr
#'
#' Internal function that applies styler formatting and lintr checks to R code.
#' Returns formatted code and/or linting messages for inclusion in documentation.
#'
#' @param code Character vector of R code lines
#' @param use_styler Logical, whether to apply styler formatting
#' @param use_lintr Logical, whether to run lintr checks
#' @param chunk_id Identifier for the chunk (for messages)
#'
#' @return A list with elements:
#'   \itemize{
#'     \item \code{styled_code}: Character vector of styled code (if use_styler = TRUE)
#'     \item \code{lint_messages}: Character vector of lint messages (if use_lintr = TRUE)
#'     \item \code{has_style_changes}: Logical indicating if styler made changes
#'     \item \code{has_lint_issues}: Logical indicating if lintr found issues
#'   }
#'
#' @keywords internal
#' @noRd
check_code_quality <- function(code, use_styler = FALSE, use_lintr = FALSE, chunk_id = "") {
  
  result <- list(
    styled_code = NULL,
    lint_messages = NULL,
    has_style_changes = FALSE,
    has_lint_issues = FALSE
  )
  
  # Return early if both are disabled
  if (!use_styler && !use_lintr) {
    return(result)
  }
  
  # Join code lines for processing
  code_text <- paste(code, collapse = "\n")
  
  # Apply styler if requested and available
  if (use_styler) {
    if (requireNamespace("styler", quietly = TRUE)) {
      tryCatch({
        # Style the code
        styled_text <- styler::style_text(code_text)
        styled_code <- as.character(styled_text)
        
        # Check if styling made any changes
        if (!identical(code, styled_code)) {
          result$styled_code <- styled_code
          result$has_style_changes <- TRUE
        }
      }, error = function(e) {
        cli::cli_alert_warning("styler failed for chunk {chunk_id}: {e$message}")
      })
    } else {
      cli::cli_alert_warning("styler package not available. Install it with: install.packages('styler')")
    }
  }
  
  # Run lintr if requested and available
  if (use_lintr) {
    if (requireNamespace("lintr", quietly = TRUE)) {
      tryCatch({
        # Create temporary file for linting
        temp_file <- tempfile(fileext = ".R")
        on.exit(unlink(temp_file), add = TRUE)
        writeLines(code_text, temp_file)
        
        # Run lintr
        lint_results <- lintr::lint(temp_file)
        
        if (length(lint_results) > 0) {
          # Format lint messages
          messages <- sapply(lint_results, function(lint) {
            paste0("Line ", lint$line_number, ": ", lint$message)
          })
          result$lint_messages <- messages
          result$has_lint_issues <- TRUE
        }
      }, error = function(e) {
        cli::cli_alert_warning("lintr failed for chunk {chunk_id}: {e$message}")
      })
    } else {
      cli::cli_alert_warning("lintr package not available. Install it with: install.packages('lintr')")
    }
  }
  
  return(result)
}


#' Format Code Quality Results as Tabset
#'
#' Internal function that formats styler and lintr results into a Quarto tabset.
#' Only creates tabs if there are actual issues or changes to report.
#'
#' @param quality_check Result from check_code_quality()
#' @param original_code Character vector of original code lines
#'
#' @return Character vector of formatted tabset lines, or NULL if no issues
#'
#' @keywords internal
#' @noRd
format_quality_tabset <- function(quality_check, original_code) {
  
  # Return NULL if no issues or changes
  if (!quality_check$has_style_changes && !quality_check$has_lint_issues) {
    return(NULL)
  }
  
  tabset_lines <- character()
  
  # Start tabset
  tabset_lines <- c(tabset_lines, "::: {.panel-tabset}")
  tabset_lines <- c(tabset_lines, "")
  
  # Add original code tab
  tabset_lines <- c(tabset_lines, "## Original Code")
  tabset_lines <- c(tabset_lines, "")
  tabset_lines <- c(tabset_lines, "```{r}")
  tabset_lines <- c(tabset_lines, original_code)
  tabset_lines <- c(tabset_lines, "```")
  tabset_lines <- c(tabset_lines, "")
  
  # Add styled code tab if there are changes
  if (quality_check$has_style_changes) {
    tabset_lines <- c(tabset_lines, "## Styled Code")
    tabset_lines <- c(tabset_lines, "")
    tabset_lines <- c(tabset_lines, "```{r}")
    tabset_lines <- c(tabset_lines, quality_check$styled_code)
    tabset_lines <- c(tabset_lines, "```")
    tabset_lines <- c(tabset_lines, "")
  }
  
  # Add lint issues tab if there are issues
  if (quality_check$has_lint_issues) {
    tabset_lines <- c(tabset_lines, "## Lint Issues")
    tabset_lines <- c(tabset_lines, "")
    for (msg in quality_check$lint_messages) {
      tabset_lines <- c(tabset_lines, paste0("- ", msg))
    }
    tabset_lines <- c(tabset_lines, "")
  }
  
  # Close tabset
  tabset_lines <- c(tabset_lines, ":::")
  tabset_lines <- c(tabset_lines, "")
  
  return(tabset_lines)
}
