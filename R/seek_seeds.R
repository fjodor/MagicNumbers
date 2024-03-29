#' Iterate over a vector of seeds to find a magic number for your word of choice.
#'
#' @param .seeds vector of seeds to iterate over, e. g. 0:1e5
#' @param .word word of choice that you want to find a magic number for
#' @param .eval type of evaluation: "seq" uses parallel::lapply(), "par" uses clusterApply, "future" uses future.apply::future_lapply
#' @param .progress Show progress bar (TRUE) or not (FALSE); ignored if .eval = "par"
#' @param cl cluster object for clusterApply(). cl <- makeCluster(parallelly::availableCores(omit = 1))
#'
#' @return Currently no useful return value. In case of success, calculation stops, the magic number (seed) is displayed in the console.
#' @export
#'
#' @examples seek_seeds_word(0:1e3, "ab")
#' @examples seek_seeds_word(50000:70000, "xmas", .eval = "par", cl)
#' @examples seek_seeds_word(50000:70000, "xmas", .eval = "future", cl)

seek_seeds_word <- function(.seeds, .word, .eval = "seq", cl = NULL, .progress = FALSE) {
  .size <- nchar(.word)
  stopifnot(.size > 0)
  stopifnot(.eval %in% c("seq", "par", "future"))
  if (.eval == "seq" & .progress == TRUE) {
    progressr::handlers(global = TRUE)
    progressr::handlers("progress")
    p <- progressr::progressor(along = .seeds)
    lapply(.seeds, function(x) {
      p()
      res <- check_seed_word(x, size = .size, word = .word)
      if (res) stop(paste("Success: Seed:", x), call. = FALSE)
    })
    message(paste0("Sorry, no magic number found for ", .word,
                   " using seeds from ", min(.seeds), " to ", max(.seeds), " at ", Sys.time(),
                   ".\nSequential lapply() was used for iteration."))
  }
  if (.eval == "seq" & .progress == FALSE) {
    lapply(.seeds, function(x) {
      res <- check_seed_word(x, size = .size, word = .word)
      if (res) stop(paste("Success: Seed:", x), call. = FALSE)
    })
    message(paste0("Sorry, no magic number found for ", .word,
                  " using seeds from ", min(.seeds), " to ", max(.seeds), " at ", Sys.time(),
                  ".\nSequential lapply() was used for iteration."))
  }
  if (.eval == "par") {
    # stopifnot(exists(quote(cl)))
    # clusterExport(cl, "check_seed_word")
    clusterApply(cl, .seeds, function(x) {
      res <- check_seed_word(x, size = .size, word = .word)
      if (res) stop(paste("Success: Seed:", x), call. = FALSE)
    })
    message(paste0("Sorry, no magic number found for ", .word,
                   " using seeds from ", min(.seeds), " to ", max(.seeds), " at ", Sys.time(),
                   ".\nparallel::clusterApply() was used for iteration."))
  }
  if (.eval == "future" & .progress == TRUE) {
    progressr::handlers(global = TRUE)
    progressr::handlers("progress")
    p <- progressr::progressor(along = .seeds)
    future.apply::future_lapply(.seeds, function(x) {
      p()
      res <- check_seed_word(x, size = .size, word = .word)
      if (res) stop(paste("Success: Seed:", x), call. = FALSE)
    }, future.globals = "check_seed_word", future.seed = NULL
    )
    message(paste0("Sorry, no magic number found for ", .word,
                   " using seeds from ", min(.seeds), " to ", max(.seeds), " at ", Sys.time(),
                   ".\nfuture.apply::future_lapply() was used for iteration."))
  }
  if (.eval == "future" & .progress == FALSE) {
    future.apply::future_lapply(.seeds, function(x) {
      res <- check_seed_word(x, size = .size, word = .word)
      if (res) stop(paste("Success: Seed:", x), call. = FALSE)
    }, future.globals = "check_seed_word", future.seed = NULL
    )
    message(paste0("Sorry, no magic number found for ", .word,
                   " using seeds from ", min(.seeds), " to ", max(.seeds), " at ", Sys.time(),
                   ".\nfuture.apply::future_lapply() was used for iteration."))
  }
  invisible(NULL)
}

seek_seeds_phrase <- function(.seeds, .phrase, .eval = "seq", cl = NULL, .progress = FALSE) {
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
    stopifnot(exists(quote(cl)))
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


#' Iterate over a vector of seeds to find a magic number for your number of choice.
#'
#' @param .seeds vector of seeds to iterate over, e. g. 0:1e5
#' @param .number number of choice that you want to find a magic number for
#' @param .progress Show progress bar (TRUE) or not (FALSE)
#'
#' @return Currently no useful return value. In case of success, calculation stops, the magic number (seed) is displayed in the console.
#' @export
#'
#' @examples seek_seeds_number(0:1e3, "2023")

seek_seeds_number <- function(.seeds, .number, .progress = FALSE) {
  .size <- nchar(.number)
  stopifnot(.size > 0)
  if (.progress == TRUE) {
    progressr::handlers(global = TRUE)
    progressr::handlers("progress")
    p <- progressr::progressor(along = .seeds)
    lapply(.seeds, function(x) {
      p()
      res <- check_seed_number(x, size = .size, number = .number)
      if (res) stop(paste("Success: Seed:", x), call. = FALSE)
    })
    message(paste0("Sorry, no magic number found for ", .number,
                   " using seeds from ", min(.seeds), " to ", max(.seeds), " at ", Sys.time(),
                   ".\nSequential lapply() was used for iteration."))
  }
  if (.progress == FALSE) {
    lapply(.seeds, function(x) {
      res <- check_seed_number(x, size = .size, number = .number)
      if (res) stop(paste("Success: Seed:", x), call. = FALSE)
    })
    message(paste0("Sorry, no magic number found for ", .number,
                   " using seeds from ", min(.seeds), " to ", max(.seeds), " at ", Sys.time(),
                   ".\nSequential lapply() was used for iteration."))
  }
  invisible(NULL)
}
