# Internal helper to ensure optional runtime dependencies are available
ensure_later <- function() {
  # Use later once to satisfy Import and guarantee availability when shiny runs
  if (requireNamespace("later", quietly = TRUE)) {
    later::later(function() {}, delay = 0)
  }
}
