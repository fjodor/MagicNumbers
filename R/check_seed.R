#' Check if a random seed generates a specific word (only letters, no blanks)
#'
#' @param seed random seed, used in set.seed(seed)
#' @param size number of characters of word, used in sample(..., size = size)
#' @param word word to check: may contain only lower-case letters, no blanks
#'
#' @return TRUE if seed generates the word, FALSE otherwise
#'
#' @examples internal function, called from seek_seeds

check_seed_word <- function(seed, size, word) {
  set.seed(seed)
  text <- sample(letters, size = size, replace = TRUE) |> paste(collapse = "")
  text == word
}

#' Check if a random seed generates a specific phrase (letters and blanks)
#'
#' @param seed random seed, used in set.seed(seed)
#' @param size number of characters of word, used in sample(..., size = size)
#' @param phrase phrase to check: may contain lower-case letters and blanks
#'
#' @return
#'
#' @examples

check_seed_phrase <- function(seed, size, phrase) {
  set.seed(seed)
  text <- sample(c(letters, " "), size = size, replace = TRUE) |> paste(collapse = "")
  text == phrase
}
