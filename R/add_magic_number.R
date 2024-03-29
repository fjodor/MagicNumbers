#' Expand magic numbers data: Add row containing seed and text
#'
#' @param .seed seed that generates .text when used to sample()
#' @param .text text generated by sample, used after set.seed(seed)
#' @param .data data frame to be expanded; defaults to MagicNumbers
#'
#' @return data frame that contains the new row of data
#' @export
#'
#' @examples add_magic_number(.text = "love", .seed = 249725)
#' @examples MagicNumbers <- add_magic_number(.text = "love", .seed = 249725)

add_magic_number <- function(.seed, .text, .data = MagicNumbers) {
  if (.seed %in% .data[["seed"]] & !is.na(.seed)) {
    stop(paste("Seed", .seed, "already present in data!"))
  }
  if (.text %in% .data[["text"]]) {
    stop(paste(.text, "already present in data!"))
  }
  data <- rbind(.data, data.frame(text = .text, seed = .seed))
  data <- dplyr::arrange(data, text)
  data
}
