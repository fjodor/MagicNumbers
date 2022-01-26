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
# 11 letters: programming
# 9 letters: beautiful, tidyverse
# 8 letters: solution, cruncher, favorite, language
# 7 letters: weather, teacher, rtistry
#
# German
# figuren

#---------------------------------------------------------#
# Yet to calculate!

