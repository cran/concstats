% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/inequ.R
\name{concstats_entropy}
\alias{concstats_entropy}
\title{Shannon Entropy}
\usage{
concstats_entropy(x, normalized = TRUE, na.rm = TRUE)
}
\arguments{
\item{x}{A non-negative numeric vector.}

\item{normalized}{Logical. Argument specifying whether or not a normalized
value is required. Must be either \code{TRUE} or \code{FALSE}. The default
is \code{TRUE}.}

\item{na.rm}{A logical vector that indicates whether \code{NA} values should
be excluded or not. Must be either \code{TRUE} or \code{FALSE}. The default
is \code{TRUE}. If set to \code{FALSE} the computation yields \code{NA}
if vector contains \code{NA} values.}
}
\value{
A single numeric measure.
}
\description{
Shannon Entropy
}
\examples{
# a vector of market shares
x <- c(0.4, 0.2, 0.25, 0.1, 0.05)
concstats_entropy(x, normalized = TRUE)
# a vector with NA values
x <- c(0.4, 0.2, 0.25, 0.1, 0.05, NA)
concstats_entropy(x, na.rm = FALSE)

}
\references{
Shannon, C. E. (1948). "A Mathematical Theory of Communication",
\emph{The Bell System Technical Journal} (Nokia Bell Labs).
}
