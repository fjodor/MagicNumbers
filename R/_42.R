test_seed(42, nchar = 1:10, choices = letters)

lapply(1:10, function(x) test_seed(42, x))

lapply(1:10, function(x) test_seed(42, x, choices = 0:9))

lapply(1:10, function(x) test_seed(42^2, x))
