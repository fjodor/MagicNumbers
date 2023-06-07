#' Check if a random seed generates a specific word (only letters, no blanks)
#'
#' @param seed random seed, used in set.seed(seed)
#' @param size number of characters of word, used in sample(..., size = size)
#' @param word word to check: may contain only lower-case letters, no blanks
#'
#' @return TRUE if seed generates the word, FALSE otherwise
#'
#' @examples check_seed_word(19421956, 5, "merry")  # TRUE
#' @examples check_seed_word(64927, 4, "xmas")      # TRUE

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
#' @return TRUE if seed generates the phrase, FALSE otherwise
#'
#' @examples check_seed_phrase(1, 5, "ja ja")  # FALSE

check_seed_phrase <- function(seed, size, phrase) {
  set.seed(seed)
  text <- sample(c(letters, " "), size = size, replace = TRUE) |> paste(collapse = "")
  text == phrase
}


#' Check if a random seed generates a specific number (one or more digits)
#'
#' @param seed random seed, used in set.seed(seed)
#' @param size number of digits, used in sample(..., size = size)
#' @param number number to check
#'
#' @return TRUE if seed generates the number, FALSE otherwise
#'
#' @examples check_seed_number(1, 4, "1000")  # FALSE

check_seed_number <- function(seed, size, number) {
  set.seed(seed)
  result <- sample(0:9, size = size, replace = TRUE) |> paste(collapse = "")
  result == number
}
