# Jobs for magic numbers

library(MagicNumbers)
# library(parallel)
# try(stopCluster(cl))
# Doesn't exist when starting new local job
# But recommendation: remove previous jobs before starting new one. There is an option to recover old jobs,
# which may cost memory and stability.

gc()
# cl <- makeCluster(parallelly::availableCores(omit = 2, logical = FALSE))
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
# teacher
# figuren

#---------------------------------------------------------#
# Yet to calculate!

seek_seeds_word(0:2e8, "name")


# seek_seeds_word(0:2e8, "cruncher")
# seek_seeds_word(2e8:4e8, "cruncher")
# seek_seeds_word(4e8:6e8, "cruncher")
# seek_seeds_word(6e8:8e8, "cruncher") # ran a long time, but didn't finish
# seek_seeds_word(65e7:8e8, "cruncher")
# seek_seeds_word(8e8:10e8, "cruncher")
# seek_seeds_word(10e8:12e8, "cruncher")
# seek_seeds_word(105e7:12e8, "cruncher")
# seek_seeds_word(12e8:14e8, "cruncher")
# seek_seeds_word(14e8:16e8, "cruncher")

# seek_seeds_word(0:2e8, "rtistry")
# seek_seeds_word(2e8:4e8, "rtistry")
# seek_seeds_word(4e8:6e8, "rtistry")
# seek_seeds_word(6e8:8e8, "rtistry")  # ran for a considerable time
# seek_seeds_word(65e7:8e8, "rtistry")
# seek_seeds_word(8e8:10e8, "rtistry")
# seek_seeds_word(10e8:12e8, "rtistry")
seek_seeds_word(12e8:14e8, "rtistry")

# seek_seeds_word(0:2e8, "favorite")
# seek_seeds_word(2e8:4e8, "favorite")
# seek_seeds_word(4e8:6e8, "favorite")
# seek_seeds_word(42e7:6e8, "favorite")
# seek_seeds_word(6e8:8e8, "favorite")
seek_seeds_word(8e8:10e8, "favorite")

# seek_seeds_word(0:2e8, "language")
# seek_seeds_word(2e8:4e8, "language")
# seek_seeds_word(4e8:6e8, "language")
seek_seeds_word(6e8:8e8, "language")

# seek_seeds_word(0:2e8, "tidyverse")
# seek_seeds_word(2e8:4e8, "tidyverse")
# seek_seeds_word(22e7:4e8, "tidyverse")
seek_seeds_word(4e8:6e8, "tidyverse")
