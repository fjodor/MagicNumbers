.onLoad <- function(libname, pkgname) {
  packageStartupMessage("Welcome to MagicNumbers! Have fun!\nTo suppress this message, use suppressPackageStartupMessages(library(MagicNumbers))\nNote this package uses progressr for progress bars, and sets progressr::handlers(global = TRUE))")
}
