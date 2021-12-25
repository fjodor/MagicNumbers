library(parallel)
cl <- makeCluster(parallelly::availableCores(omit = 2))

# bench::mark(
#   lapply = seek_seeds_word(0:1e3, "xmas"),
#   clusterApply = seek_seeds_word(0:1e3, "xmas", .eval = "par", cl),
#   future_lapply = seek_seeds_word(0:1e3, "xmas", .eval = "future", cl)
# )

# lapply 1.11s
# clusterApply 345ms
# future_lapply 1.16s

library(future)
plan(cluster)

bench::mark(
  lapply = seek_seeds_word(0:1e3, "xmas"),
  clusterApply = seek_seeds_word(0:1e3, "xmas", .eval = "par", cl),
  future_lapply = seek_seeds_word(0:1e3, "xmas", .eval = "future", cl)
)

# No progress bar for clusterApply()
clusterApply = seek_seeds_word(0:1e3, "xmas", .eval = "par", cl)

plan(cluster)
bench::mark(
  lapply = seek_seeds_word(0:5e3, "xmas"),
  clusterApply = seek_seeds_word(0:5e3, "xmas", .eval = "par", cl),
  future_lapply = seek_seeds_word(0:5e3, "xmas", .eval = "future", cl)
)

plan(multisession)
bench::mark(
  lapply = seek_seeds_word(0:5e3, "xmas"),
  clusterApply = seek_seeds_word(0:5e3, "xmas", .eval = "par", cl),
  future_lapply = seek_seeds_word(0:5e3, "xmas", .eval = "future", cl)
)

plan(sequential)
bench::mark(
  lapply = seek_seeds_word(0:5e3, "xmas"),
  clusterApply = seek_seeds_word(0:5e3, "xmas", .eval = "par", cl),
  future_lapply = seek_seeds_word(0:5e3, "xmas", .eval = "future", cl)
)

stopCluster(cl)


# Test without progress bar ...
# future_lapply() way too slow
# Only clusterApply() is acceptable

