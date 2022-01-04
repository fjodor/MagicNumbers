# Jobs for magic numbers

library(MagicNumbers)
library(parallel)
cl <- makeCluster(parallelly::availableCores(omit = 2, logical = FALSE))
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

seek_seeds_word(0:3e8, "secret", .eval = "future", cl)

seek_seeds_word(0:3e8, "job", .eval = "future", cl)
seek_seeds_word(0:3e8, "user", .eval = "future", cl)
seek_seeds_word(0:3e8, "most", .eval = "future", cl)
seek_seeds_word(0:3e8, "least", .eval = "future", cl)
seek_seeds_word(0:3e8, "color", .eval = "future", cl)
seek_seeds_word(0:3e8, "teacher", .eval = "future", cl)

seek_seeds_word(0:3e8, "number", .eval = "future", cl)

seek_seeds_word(0:3e8, "python", .eval = "future", cl)

seek_seeds_word(0:3e8, "animal", .eval = "future", cl)

seek_seeds_word(0:3e8, "cruncher", .eval = "future", cl)

seek_seeds_word(0:3e8, "rtistry", .eval = "future", cl)

seek_seeds_word(0:3e8, "favorite", .eval = "future", cl)

seek_seeds_word(0:3e8, "language", .eval = "future", cl)

seek_seeds_word(0:3e8, "tidyverse", .eval = "future", cl)
