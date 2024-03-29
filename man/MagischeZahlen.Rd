% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/MagischeZahlen.R
\docType{data}
\name{MagischeZahlen}
\alias{MagischeZahlen}
\title{Magic Numbers = seeds that generate specific GERMAN texts in sample(...)}
\format{
A data frame with 2 variables and, hopefully, a steadily growing number of rows:
\describe{
\item{text}{Text to be generated by sample()}
\item{seed}{The magic number to be used in set.seed(seed) before sample()}
}
}
\usage{
MagischeZahlen
}
\description{
Dataset containing magic numbers that can be used in set.seed() to generate GERMAN text accordingly in sample(...).
}
\keyword{datasets}
