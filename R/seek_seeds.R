#' Iterate over a vector of seeds to find a magic number for your word of choice.
#'
#' @param cl cluster object for clusterApply(). cl <- makeCluster(parallelly::availableCores(omit = 1))
#' @param .seeds vector of seeds to iterate over, e. g. 0:1e5
#' @param .word word of choice that you want to find a magic number for
#' @param .eval type of evaluation: "seq" uses parallel::lapply(), "par" uses clusterApply, "future" uses future.apply::future_lapply
#'
#' @return Currently no useful return value. In case of success, calculation stops, the magic number (seed) is displayed in the console.
#' @export
#'
#' @examples seek_seeds_word(0:1e3, "ab")

seek_seeds_word <- function(cl = NULL, .seeds, .word, .eval = "seq") {
  size <- nchar(.word)
  stopifnot(size > 0)
  stopifnot(.eval %in% c("seq", "par", "future"))
  if (.eval == "seq") {
    p <- progressr::progressor(along = .seeds)
    lapply(.seeds, function(x) {
      p()
      res <- check_seek_word(x, size = size, word = .word)
      if (res) stop(paste("Success: Seed:", x))
    })
  }
  if (.eval == "par") {
    stopifnot(exists(cl))
    clusterApply(cl, .seeds, function(x) {
      res <- check_seek_word(x, size = size, word = .word)
      if (res) stop(paste("Success: Seed:", x))
    })
  }
  if (.eval == "future") {
    p <- progressr::progressor(along = .seeds)
    future.apply::future_lapply(.seeds, function(x) {
      p()
      res <- check_seek_word(x, size = size, word = .word)
      if (res) stop(paste("Success: Seed:", x))
    })
  }
  invisible(NULL)
}

seek_seeds_phrase <- function(cl, .seeds, .phrase, .eval = "seq") {
  size <- nchar(.phrase)
  stopifnot(size > 0)
  stopifnot(.eval %in% c("seq", "par", "future"))
  if (.eval == "seq") {
    p <- progressr::progressor(along = .seeds)
    lapply(.seeds, function(x) {
      p()
      res <- check_seek_phrase(x, size = size, word = .word)
      if (res) stop(paste("Success: Seed:", x))
    })
  }
  if (.eval == "par") {
    stopifnot(exists(cl))
    clusterApply(cl, .seeds, function(x) {
      res <- check_seek_phrase(x, size = size, word = .word)
      if (res) stop(paste("Success: Seed:", x))
    })
  }
  if (.eval == "future") {
    if (!requireNamespace("future.apply", quietly = TRUE)) {
      stop("Please install package future.apply to use this option.")
    }
    p <- progressr::progressor(along = .seeds)
    future.apply::future_lapply(.seeds, function(x) {
      p()
      res <- check_seek_phrase(x, size = size, word = .word)
      if (res) stop(paste("Success: Seed:", x))
    })
  }
  invisible(NULL)
}
