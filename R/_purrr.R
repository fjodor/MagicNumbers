seeds <- c(2219868, 10641, 443238, 9487)
word_lengths <- c(5, 3, 4, 4)
choices <- list(letters, letters, letters, 0:9)

magic_message <- function(seed, word_length, choices) {
  set.seed(seed)
  sample(choices, size = word_length, replace = TRUE) |>
    paste(collapse = "") |>
    stringr::str_to_title()
}

purrr::pmap_chr(list(seeds, word_lengths, choices), magic_message) |> cat()

