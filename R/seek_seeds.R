#' Iterate over a vector of seeds to find a magic number for your word of choice.
#'
#' @param .seeds vector of seeds to iterate over, e. g. 0:1e5
#' @param .word word of choice that you want to find a magic number for
#' @param .eval type of evaluation: "seq" uses parallel::lapply(), "par" uses clusterApply, "future" uses future.apply::future_lapply
#' @param cl cluster object for clusterApply(). cl <- makeCluster(parallelly::availableCores(omit = 1))
#'
#' @return Currently no useful return value. In case of success, calculation stops, the magic number (seed) is displayed in the console.
#' @export
#'
#' @examples seek_seeds_word(0:1e3, "ab")
#' @examples seek_seeds_word(50000:70000, "xmas", .eval = "par", cl)
#' @examples seek_seeds_word(50000:70000, "xmas", .eval = "future", cl)

seek_seeds_word <- function(.seeds, .word, .eval = "seq", cl = NULL) {
  size <- nchar(.word)
  stopifnot(size > 0)
  stopifnot(.eval %in% c("seq", "par", "future"))
  if (.eval == "seq") {
    p <- progressr::progressor(along = .seeds)
    progressr::handlers(global = TRUE)
    progressr::handlers("progress")
      lapply(.seeds, function(x) {
        p()
        res <- check_seed_word(x, size = size, word = .word)
        if (res) stop(paste("Success: Seed:", x), call. = FALSE)
      })
      message("Sorry, no magic number found.\nSequential lapply() was used for iteration.")
  }
  if (.eval == "par") {
    stopifnot(exists(quote(cl)))
    clusterApply(cl, .seeds, function(x) {
      res <- check_seed_word(x, size = size, word = .word)
      if (res) stop(paste("Success: Seed:", x), call. = FALSE)
    })
    message("Sorry, no magic number found.\nparallel::clusterApply() was used for iteration.")
  }
  if (.eval == "future") {
    p <- progressr::progressor(along = .seeds)
    progressr::handlers(global = TRUE)
    progressr::handlers("progress")
    future.apply::future_lapply(.seeds, function(x) {
      p()
      res <- check_seed_word(x, size = size, word = .word)
      if (res) stop(paste("Success: Seed:", x), call. = FALSE)
    }, future.globals = "check_seed_word", future.seed = NULL
    )
    message("Sorry, no magic number found.\nfuture.apply::future_lapply() was used for iteration.")
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
      res <- check_seed_phrase(x, size = size, phrase = .phrase)
      if (res) stop(paste("Success: Seed:", x))
    })
  }
  if (.eval == "par") {
    stopifnot(exists(cl))
    clusterApply(cl, .seeds, function(x) {
      res <- check_seed_phrase(x, size = size, phrase = .phrase)
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
      res <- check_seed_phrase(x, size = size, phrase = .phrase)
      if (res) stop(paste("Success: Seed:", x))
    })
  }
  invisible(NULL)
}
