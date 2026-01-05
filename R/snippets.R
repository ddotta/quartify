#' Install quartify RStudio Snippets
#'
#' Installs useful RStudio snippets for working with quartify. These snippets
#' help you quickly insert common structures when writing R scripts that will
#' be converted to Quarto documents.
#'
#' The following snippets are installed:
#'
#' - **header**: Insert a standard R script header with Title, Author, Date, and Description
#' - **callout**: Insert a Quarto callout structure
#' - **mermaid**: Insert a Mermaid diagram chunk
#' - **tabset**: Insert a tabset structure
#'
#' @details
#' The snippets are installed in your RStudio snippets file for R:
#' - Windows: `%APPDATA%/RStudio/snippets/r.snippets`
#' - Mac/Linux: `~/.config/rstudio/snippets/r.snippets`
#'
#' If you already have custom snippets, this function will append the quartify
#' snippets to your existing file. If quartify snippets were previously installed,
#' they will be automatically removed and replaced with the new version.
#'
#' The function will automatically open the snippets file in RStudio if available.
#' Simply save the file (Ctrl+S / Cmd+S) to reload the snippets immediately
#' without restarting RStudio. Then type the snippet name (e.g., `header`)
#' and press Tab to insert the template.
#'
#' @param backup Logical. If TRUE (default), creates a backup of your existing
#'   snippets file before modifying it.
#' @param path Character. Custom path for the snippets file. If NULL (default),
#'   uses the standard RStudio snippets location. For examples/tests, use tempdir().
#'
#' @return Invisibly returns the path to the snippets file.
#'
#' @export
#'
#' @examples
#' if (interactive()) {
#'   # Install quartify snippets to RStudio
#'   install_quartify_snippets()
#'
#'   # Install without backup
#'   install_quartify_snippets(backup = FALSE)
#' }
#'
#' # For testing: install to temp directory
#' temp_snippets <- file.path(tempdir(), "r.snippets")
#' install_quartify_snippets(path = temp_snippets)
install_quartify_snippets <- function(backup = TRUE, path = NULL) {
  # Définition des snippets
  snippets <- '
# quartify snippets

snippet header
	# Title : ${1:Title}
	#
	# Author : ${2:Author}
	#
	# Date : ${3:`r Sys.Date()`}
	#
	# Description : ${4:Description}
	#

snippet callout
	# callout-${1:note} - ${2:Title}
	# ${0}

snippet mermaid
	#| mermaid
	#| eval: true
	${0}

snippet tabset
	# tabset
	# tab - ${1:Tab Title}
	# ${0}
'

  # Détection robuste du chemin du fichier snippets
  get_rstudio_snippets_path <- function() {
    if (!is.null(path)) return(normalizePath(path, mustWork = FALSE))
    # Windows
    if (.Platform$OS.type == "windows") {
      appdata <- Sys.getenv("APPDATA")
      if (nzchar(appdata)) {
        return(file.path(appdata, "RStudio", "snippets", "r.snippets"))
      }
    }
    # XDG (Linux)
    xdg <- Sys.getenv("XDG_CONFIG_HOME")
    if (nzchar(xdg)) {
      p <- file.path(xdg, "rstudio", "snippets", "r.snippets")
      if (file.exists(dirname(p)) || dir.create(dirname(p), recursive = TRUE, showWarnings = FALSE)) return(p)
    }
    # RStudio Workbench/Server/Desktop (Linux/Mac)
    home <- Sys.getenv("HOME")
    if (nzchar(home)) {
      # Modern config path
      p1 <- file.path(home, ".config", "rstudio", "snippets", "r.snippets")
      if (file.exists(dirname(p1)) || dir.create(dirname(p1), recursive = TRUE, showWarnings = FALSE)) return(p1)
      # Legacy path
      p2 <- file.path(home, ".R", "snippets", "r.snippets")
      if (file.exists(dirname(p2)) || dir.create(dirname(p2), recursive = TRUE, showWarnings = FALSE)) return(p2)
    }
    stop("Impossible de déterminer le chemin du fichier de snippets RStudio.")
  }

  snippets_file <- get_rstudio_snippets_path()
  snippets_dir <- dirname(snippets_file)
  if (!dir.exists(snippets_dir)) dir.create(snippets_dir, recursive = TRUE)

  # Lecture, sauvegarde, suppression de l'ancien bloc quartify
  if (file.exists(snippets_file)) {
    existing_content <- readLines(snippets_file, warn = FALSE)
    # Sauvegarde
    if (backup) {
      backup_file <- paste0(snippets_file, ".backup.", format(Sys.time(), "%Y%m%d_%H%M%S"))
      file.copy(snippets_file, backup_file, overwrite = TRUE)
      message("Created backup: ", backup_file)
    }
    # Suppression de l'ancien bloc quartify
    start <- grep("# quartify snippets", existing_content, fixed = TRUE)
    if (length(start) > 0) {
      end <- which(seq_along(existing_content) > start[1] & existing_content == "")
      if (length(end) > 0) {
        end <- end[1] - 1
      } else {
        end <- length(existing_content)
      }
      existing_content <- existing_content[-c(start[1]:end)]
    }
    # Réécriture du fichier (préserve les autres snippets)
    writeLines(existing_content, snippets_file)
    # Ajout d'une ligne vide si besoin
    if (length(existing_content) > 0 && existing_content[length(existing_content)] != "") {
      cat("\n", file = snippets_file, append = TRUE)
    }
    cat(snippets, file = snippets_file, append = TRUE)
    message("quartify snippets installed/updated in: ", snippets_file)
  } else {
    cat(snippets, file = snippets_file)
    message("Created new snippets file: ", snippets_file)
  }

  message("\nSnippets installed successfully!")
  message("If they do not appear, ouvrez le fichier ci-dessous dans RStudio et sauvegardez-le pour recharger les snippets immédiatement.")
  message(snippets_file)
  message("\nAvailable snippets:")
  message("  - header  : R script header template")
  message("  - callout : Quarto callout structure")
  message("  - mermaid : Mermaid diagram chunk")
  message("  - tabset  : Tabset structure")
  message("\nType the snippet name and press Tab to use it.")

  # Ouvre dans RStudio si possible
  if (requireNamespace("rstudioapi", quietly = TRUE) && rstudioapi::isAvailable()) {
    try(rstudioapi::navigateToFile(snippets_file), silent = TRUE)
    message("Le fichier de snippets a été ouvert dans RStudio. Sauvegardez-le pour recharger les snippets immédiatement.")
  }

  invisible(snippets_file)
}
