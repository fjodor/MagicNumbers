set.seed(19421956)
part1 <- sample(letters, size = 5, replace = TRUE) |>
  paste(collapse = "")
set.seed(64927)
part2 <- sample(letters, size = 4, replace = TRUE) |>
  paste(collapse = "")
paste(part1, part2) |>
  stringr::str_to_title()
