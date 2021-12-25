cl <- makeCluster(parallelly::availableCores(omit = 2))

bench::mark(
  lapply = seek_seeds_word(0:1e3, "xmas"),
  clusterApply = seek_seeds_word(0:1e3, "xmas", .eval = "par", cl),
  future_lapply = seek_seeds_word(0:1e3, "xmas", .eval = "future", cl)
)

# lapply 1.11s
# clusterApply 345ms
# future_lapply 1.16s

future::plan("cluster")

bench::mark(
  lapply = seek_seeds_word(0:1e3, "xmas"),
  clusterApply = seek_seeds_word(0:1e3, "xmas", .eval = "par", cl),
  future_lapply = seek_seeds_word(0:1e3, "xmas", .eval = "future", cl)
)

bench::mark(
  lapply = seek_seeds_word(0:1e4, "xmas"),
  clusterApply = seek_seeds_word(0:1e4, "xmas", .eval = "par", cl),
  future_lapply = seek_seeds_word(0:1e4, "xmas", .eval = "future", cl)
)

plan(sequential)
stopCluster(cl)
