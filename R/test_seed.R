#' Test if a given seed returns a sensible text when used to sample()
#'
#' @param seed to be used in set.seed(seed)
#' @param nchar length of expected text = number of random one character samples
#' @param choices what to choose from; defaults to letters; can be c(letters, " ") to allow for phrases
#'
#' @return
#' @export
#'
#' @examples test_seed(19421956, 5)
#' @examples test_seed(64927, 4)

test_seed <- function(seed, nchar, choices = letters) {
  set.seed(seed)
  sample(choices, size = nchar, replace = TRUE) |>
    paste(collapse = "") |>
    stringr::str_to_title()
}
