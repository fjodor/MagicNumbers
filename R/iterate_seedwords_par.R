#' Iterate over a vector of seeds to find a magic number for your word of choice. Runs in parallel using clusterApply()
#'
#' @param .seeds vector of seeds to iterate over, e. g. 0:1e5
#' @param .word word of choice that you want to find a magic number for
#' @param cl cluster object for clusterApply(). cl <- makeCluster(parallelly::availableCores(omit = 1))
#'
#' @return Currently no useful return value. In case of success, calculation stops, the magic number (seed) is displayed in the console.
#' @export
#'
#' @examples # Set up parallelization
#' @examples library(parallel)
#' @examples cl <- makeCluster(parallelly::availableCores(omit = 1))
#' @examples iterate_seedwords_par(0:1e3, "I", cl)

iterate_seedwords_par <- function(.seeds, .word, cl) {
  size <- nchar(.word)
  # switch(stringr::str_detect(.message, " "), <word> or <phrase>)
  clusterApply(cl, .seeds, function(x) {
    res <- check_seed_word(x, size = size, word = .word)
    if (res) stop(paste("Success: Seed:", x))
  })
  invisible(NULL)
}
