library(MagicNumbers)
library(parallel)
cl <- makeCluster(parallelly::availableCores(omit = 1))

library(future)

# Note that bench::mark() may be inaccurate in parallelization context
# using tictoc instead

library(tictoc)

# Default: lapply(), no progress bar
gc()
tic()
seek_seeds_word(0:1e6, "merry")
toc()

# Default: lapply(), progress bar
gc()
tic()
seek_seeds_word(0:1e6, "merry", .progress = TRUE)
toc()

# Parallel using clusterApply, no progress bar; none possible in this approach
gc()
tic()
seek_seeds_word(0:1e6, "merry", .eval = "par", cl)
toc()

# Parallel using future_lapply(), cluster, no progress bar
gc()
plan(cluster)
tic()
seek_seeds_word(0:1e6, "merry", .eval = "future", cl)
toc()

# Parallel using future_lapply(), cluster, progress bar
gc()
plan(cluster)
tic()
seek_seeds_word(0:1e6, "merry", .eval = "future", cl, .progress = TRUE)
toc()

# Parallel using future_lapply(), no progress bar, multisession
gc()
plan(multisession)
tic()
seek_seeds_word(0:1e6, "merry", .eval = "future", cl)
toc()

# Parallel using future_lapply(), progress bar, multisession
gc()
plan(multisession)
tic()
seek_seeds_word(0:1e6, "merry", .eval = "future", cl, .progress = TRUE)
toc()


# Increase search range

# Default: lapply(), no progress bar
gc()
tic()
seek_seeds_word(0:5e6, "merry")
toc()

# Parallel using future_lapply(), cluster, no progress bar
gc()
plan(cluster)
tic()
seek_seeds_word(0:5e6, "merry", .eval = "future", cl)
toc()

# Parallel using future_lapply(), no progress bar, multisession
gc()
plan(multisession)
tic()
seek_seeds_word(0:5e6, "merry", .eval = "future", cl)
toc()

# clusterApply for comparison?
gc()
tic()
seek_seeds_word(0:5e6, "merry", .eval = "par", cl)
toc()

# Old function for comparison
gc()
tic()
iterate_seedwords_par(0:5e6, "merry", cl)
toc()
