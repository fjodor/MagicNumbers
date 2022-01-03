# Jobs for magic numbers

library(MagicNumbers)
library(parallel)
cl <- makeCluster(parallelly::availableCores(omit = 2, logical = FALSE))
library(future)
plan(cluster)

# seek_seeds_word(20e6:45e6, "programming", .eval = "future", cl)
# seek_seeds_word(45e6:1e8, "programming", .eval = "future", cl)
# seek_seeds_word(10e7:50e7, "programming", .eval = "future", cl)
# seek_seeds_word(50e7:55e7, "programming", .eval = "future", cl)
# seek_seeds_word(55e7:10e8, "programming", .eval = "future", cl)
# seek_seeds_word(10e8:11e8, "programming", .eval = "future", cl)
# seek_seeds_word(11e8:12e8, "programming", .eval = "future", cl)
# seek_seeds_word(12e8:14e8, "programming", .eval = "future", cl)
# seek_seeds_word(14e8:17e8, "programming", .eval = "future", cl)
# seek_seeds_word(17e8:20e8, "programming", .eval = "future", cl)

# This errors out: exceeds the maximum seed value!
# seek_seeds_word(20e8:22e8, "programming", .eval = "future", cl)
# max seed = 2147483647 = 2.147...e09
# So it seems unlikely to find seeds for such lengthy words
# ... at least with the default random seed generator

# seek_seeds_word(0:1e7, "beautiful", .eval = "future", cl)
# seek_seeds_word(1e7:10e7, "beautiful", .eval = "future", cl)
# seek_seeds_word(10e7:50e7, "beautiful", .eval = "future", cl)
# seek_seeds_word(50e7:10e8, "beautiful", .eval = "future", cl)
# seek_seeds_word(10e8:12e8, "beautiful", .eval = "future", cl)
# seek_seeds_word(12e8:14e8, "beautiful", .eval = "future", cl)
# seek_seeds_word(14e8:17e8, "beautiful", .eval = "future", cl)
# seek_seeds_word(17e8:21.47483647e8, "beautiful", .eval = "future", cl)

# Too long a word as well! :-(

# seek_seeds_word(0:3e8, "pretty", .eval = "future", cl)
seek_seeds_word(3e8:6e8, "pretty", .eval = "future", cl)

seek_seeds_word(0:3e8, "face", .eval = "future", cl)

