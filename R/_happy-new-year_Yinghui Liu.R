# Seeds for Happy New Year 2022 (25 Dec 2021)
# If you use R, this is the gift to you.

# Source: https://www.linkedin.com/posts/yinghui-liu-phd-72aa3419_merry-xmas-25-dec-2021-if-you-use-r-this-activity-6880796218159702016-13RW/
# Yinghui Liu PhD

set.seed(2219868)
str1 <- paste0(sample(letters, 5, replace = TRUE),collapse = "")

set.seed(10641)
str2 <- paste0(sample(letters, 3, replace = TRUE),collapse = "")

set.seed(443238)
str3 <- paste0(sample(letters, 4, replace = TRUE),collapse = "")

paste(str1, str2, str3)

# If anyone wants to add "2022", can use seed "9487".
set.seed(9487)
str4 <- paste0(sample(0:9, 4, replace = TRUE),collapse = "")

paste(str1, str2, str3, str4)


