% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mstruct.R
\name{concstats_top}
\alias{concstats_top}
\title{Top market share}
\usage{
concstats_top(x, na.rm = TRUE)
}
\arguments{
\item{x}{A non-negative numeric vector.}

\item{na.rm}{A logical vector that indicates whether \code{NA} values should
be excluded or not. Must be either \code{TRUE} or \code{FALSE}. The default
is \code{TRUE}.
If set to \code{FALSE} the computation yields \code{NA} if \code{NA} values
are present.}
}
\value{
A positive numeric value, which indicates the top market share in
percent.
}
\description{
Top market share
}
\examples{
# a vector of market shares
x <- c(0.4, 0.2, 0.25, 0.1, 0.05)
concstats_top(x)
}
