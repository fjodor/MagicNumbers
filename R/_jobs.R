# Jobs for magic numbers

library(MagicNumbers)
library(parallel)
cl <- makeCluster(parallelly::availableCores(omit = 1))
library(future)
plan(cluster)

# seek_seeds_word(20e6:45e6, "programming", .eval = "future", cl)
# seek_seeds_word(45e6:1e8, "programming", .eval = "future", cl)
# seek_seeds_word(10e7:50e7, "programming", .eval = "future", cl)
# seek_seeds_word(50e7:55e7, "programming", .eval = "future", cl)
seek_seeds_word(55e7:10e8, "programming", .eval = "future", cl)

# seek_seeds_word(0:1e6, "are", .eval = "future", cl)
# seek_seeds_word(0:1e6, "is", .eval = "future", cl)
