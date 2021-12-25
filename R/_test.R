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


#--------------------------------------------#
# Test without progress bar ...
# future_lapply() way too slow
# Only clusterApply() is acceptable

library(parallel)
cl <- makeCluster(parallelly::availableCores(omit = 2))

library(future)
plan(cluster)

bench::mark(
  lapply_progress = seek_seeds_word(0:5e3, "xmas"),
  lapply_silent = seek_seeds_word(0:5e3, "xmas", .progress = FALSE),
  clusterApply = seek_seeds_word(0:5e3, "xmas", .eval = "par", cl),
  future_lapply_progress = seek_seeds_word(0:5e3, "xmas", .eval = "future"),
  future_lapply_silent = seek_seeds_word(0:5e3, "xmas", .eval = "future", .progress = FALSE, cl)
)

bench::mark(
  future_cluster = {plan(cluster); seek_seeds_word(0:3e3, "xmas", .eval = "future")},
  future_cluster_silent = {plan(cluster); seek_seeds_word(0:3e3, "xmas", .eval = "future", .progress = FALSE)},
  future_multisession = {plan(multisession); seek_seeds_word(0:3e3, "xmas", .eval = "future")},
  future_multisession_silent = {plan(multisession); seek_seeds_word(0:3e3, "xmas", .eval = "future", .progress = FALSE)}
)

# On my machine, silent execution is more than 3x faster than execution while showing progress bar.

# Compare silent future_lapply() to clusterApply(), and different plans in future_lapply()

bench::mark(
  future_cluster_silent = {plan(cluster); seek_seeds_word(0:3e3, "xmas", .eval = "future", .progress = FALSE)},
  future_multisession_silent = {plan(multisession); seek_seeds_word(0:3e3, "xmas", .eval = "future", .progress = FALSE)},
  future_sequential_silent = {plan(sequential); seek_seeds_word(0:3e3, "xmas", .eval = "future", .progress = FALSE)}
)

# plan(sequential) is by orders of magnitude faster!
# So for this use case, parallelization does not pay off at all!

gc()

cl <- makeCluster(parallelly::availableCores(omit = 1))

bench::mark(
  clusterApply = seek_seeds_word(0:3e3, "xmas", .eval = "par", cl),
  future_seq_silent = {plan(sequential); seek_seeds_word(0:3e3, "xmas", .eval = "future", .progress = FALSE)}
)

# For this use case, future_seq_silent is way faster than clusterApply.

stopCluster(cl)

cl <- makeCluster(parallelly::availableCores(omit = 1))
plan(sequential)
gc()

bench::mark(
  lapply_silent = seek_seeds_word(0:5e3, "xmas", .progress = FALSE),
  clusterApply = seek_seeds_word(0:5e3, "xmas", .eval = "par", cl),
  future_seq_silent = seek_seeds_word(0:5e3, "xmas", .eval = "future", .progress = FALSE)
)

# clusterApply is by orders of magnitude slower using hyperthreading

stopCluster(cl)
cl <- makeCluster(parallelly::availableCores(omit = 1, logical = FALSE))
gc()

bench::mark(
  lapply_silent = seek_seeds_word(0:5e3, "xmas", .progress = FALSE),
  clusterApply = seek_seeds_word(0:5e3, "xmas", .eval = "par", cl),
  future_seq_silent = seek_seeds_word(0:5e3, "xmas", .eval = "future", .progress = FALSE)
)

# clusterApply is by orders of magnitude slower without hyperthreading for 0:5e3

stopCluster(cl)
cl <- makeCluster(parallelly::availableCores(omit = 1, logical = FALSE))
gc()

bench::mark(
  lapply_silent = seek_seeds_word(0:6e4, "xmas", .progress = FALSE),
  clusterApply = seek_seeds_word(0:6e4, "xmas", .eval = "par", cl),
  future_seq_silent = seek_seeds_word(0:6e4, "xmas", .eval = "future", .progress = FALSE)
)

# future_seq_silent wins! clusterApply far behind (20x)!
stopCluster(cl)

cl <- makeCluster(parallelly::availableCores(omit = 1, logical = FALSE))
gc()

bench::mark(
  lapply_silent = seek_seeds_word(0:1e5, "merry", .progress = FALSE),
  clusterApply = seek_seeds_word(0:1e5, "merry", .eval = "par", cl),
  future_seq_silent = seek_seeds_word(0:1e5, "merry", .eval = "future", .progress = FALSE),
  memory = FALSE
)

# clusterApply is way slower. Why??
# Could be benchmarking issue, see warning about parallel code, memory = FALSE.

stopCluster(cl)

cl <- makeCluster(parallelly::availableCores(omit = 1, logical = FALSE))
gc()

bench::mark(
  lapply_silent = seek_seeds_word(0:1e6, "merry", .progress = FALSE),
  clusterApply = seek_seeds_word(0:1e6, "merry", .eval = "par", cl),
  future_seq_silent = seek_seeds_word(0:1e6, "merry", .eval = "future", .progress = FALSE)
)

system.time(seek_seeds_word(0:1e5, "merry", .progress = FALSE))
system.time(seek_seeds_word(0:1e5, "merry", .eval = "par", cl))
system.time(seek_seeds_word(0:1e5, "merry", .eval = "future", .progress = FALSE))

# clusterApply still way slower

