seek_seed <- function(seed, size, message) {
  set.seed(seed)
  text <- sample(letters, size = size, replace = TRUE) |>
    paste(collapse = "")
  # ifelse(text == message, TRUE, FALSE)
  text == message
}

iterate_seeds <- function(cl, .seeds, .message) {
  size <- nchar(.message)
  clusterApply(cl, .seeds, function(x) {
    # print(paste("Seed:", x))
    res <- seek_seed(x, size = size, message = .message)
    if (res) stop(paste("Success: Seed:", x))
  })
  invisible(NULL)
}

test_seed <- function(seed, choices, message) {
  set.seed(seed)
  sample(choices, size = nchar(message), replace = TRUE) |>
    paste(collapse = "") |>
    stringr::str_to_title()
}

library(parallel)
cl <- makeCluster(parallelly::availableCores(omit = 2))
clusterExport(cl, "seek_seed")

#-------------------------------------------------------------#

# iterate_seeds(cl, 18e6:20e6, "merry")
# iterate_seeds(cl, 194e5:195e5, "merry")

# iterate_seeds(cl, 0:1e6, "love")
# test_seed(249725, letters, "xxxx")
# test_seed(249725, 4)

# iterate_seeds(cl, 0:1e6, "happy")
# iterate_seeds(cl, 1e6:4e6, "happy")
# test_seed(2219868, letters, "xxxxx")
# test_seed(2219868, 5)

# iterate_seeds(cl, 0:5e6, "year")
# test_seed(443238, 4)

iterate_seeds(cl, 0:5e6, "new")
