check_seed_word <- function(seed, size, word) {
  set.seed(seed)
  text <- sample(letters, size = size, replace = TRUE) |> paste(collapse = "")
  text == word
}

iterate_seedwords_par <- function(.seeds, .word, cl) {
  size <- nchar(.word)
  # switch(stringr::str_detect(.message, " "), <word> or <phrase>)
  clusterApply(cl, .seeds, function(x) {
    res <- check_seed_word(x, size = size, word = .word)
    if (res) stop(paste("Success: Seed:", x))
  })
  invisible(NULL)
}

# Application example:

library(parallel)
cl <- makeCluster(parallelly::availableCores(omit = 2))
clusterExport(cl, "check_seed_word")

iterate_seedwords_par(0:1e5, "too", cl)
