# Jobs for magic numbers

library(MagicNumbers)
# library(parallel)
# try(stopCluster(cl))
# Doesn't exist when starting new local job
# But recommendation: remove previous jobs before starting new one. There is an option to recover old jobs,
# which may cost memory and stability.

# gc()
# cl <- makeCluster(parallelly::availableCores(omit = 1, logical = FALSE))
# library(future)
# plan(cluster)

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

seek_seeds_word(0:9e7, "figuren")
seek_seeds_word(9e7:2e8, "figuren")

seek_seeds_word(12e8:15e8, "teacher")
seek_seeds_word(0:3e8, "animal")
seek_seeds_word(0:3e8, "cruncher")
seek_seeds_word(0:3e8, "rtistry")
seek_seeds_word(0:3e8, "favorite")
seek_seeds_word(0:3e8, "language")
seek_seeds_word(0:3e8, "tidyverse")

