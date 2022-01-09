# Jobs for magic numbers

library(MagicNumbers)
library(parallel)
# try(stopCluster(cl))
# Doesn't exist when starting new local job
# But recommendation: remove previous jobs before starting new one. There is an option to recover old jobs,
# which may cost memory and stability.

gc()
cl <- makeCluster(parallelly::availableCores(omit = 1, logical = FALSE))
library(future)
plan(cluster)

# This errors out: exceeds the maximum seed value!
# seek_seeds_word(20e8:22e8, "programming", .eval = "future", cl)
# max seed = 2147483647 = 2.147...e09
# So it seems unlikely to find seeds for such lengthy words
# ... at least with the default random seed generator

# No seed found for some longer words:
# programming
# beautiful
# solution
# weather: 7 characters!

#---------------------------------------------------------#
# Yet to calculate!

# seek_seeds_word(0:3e8, "teacher", .eval = "future", cl)
# seek_seeds_word(3e8:6e8, "teacher", .eval = "future", cl)
# seek_seeds_word(6e8:9e8, "teacher", .eval = "future", cl)
# seek_seeds_word(9e8:12e8, "teacher", .eval = "future", cl)
seek_seeds_word(12e8:15e8, "teacher", .eval = "future", cl)

seek_seeds_word(0:3e8, "animal", .eval = "future", cl)

seek_seeds_word(0:3e8, "cruncher", .eval = "future", cl)

seek_seeds_word(0:3e8, "rtistry", .eval = "future", cl)

seek_seeds_word(0:3e8, "favorite", .eval = "future", cl)

seek_seeds_word(0:3e8, "language", .eval = "future", cl)

seek_seeds_word(0:3e8, "tidyverse", .eval = "future", cl)

