#' @title Top market share
#'
#' @srrstats {G1.4} roxygen2 used to document functions
#' @usage
#'  concstats_top(x, na.rm = TRUE, digits = NULL)
#' @param x A non-negative numeric vector.
#' @param na.rm A logical vector that indicates whether \code{NA} values should
#'  be excluded or not. Must be either \code{TRUE} or \code{FALSE}. The default
#'  is \code{TRUE}. If set to \code{FALSE} the computation yields a message
#'  if the vector contains \code{NA} values. NAs will be removed for further
#'  computations.
#' @srrstats {EA4.1}  control of numeric precision
#' @param digits An optional value for digits. Specifies the minimum number of
#'  significant digits to be printed in values. The default is \code{NULL} and
#'  will use base R print option.
#' @return A positive numeric value, which indicates the top market share in
#'  percent.
#'
#' @family Market structure measures
#' @rdname concstats_top
#' @examples
#' # a vector of market shares
#' x <- c(0.4, 0.2, 0.25, 0.1, 0.05)
#' concstats_top(x, digits = 2)

#' @export
concstats_top <- function(x, na.rm = TRUE, digits = NULL) {
#' @srrstats {G2.1} Assertions on types of inputs
#' @srrstats {G5.8a} Zero-length data
#' @srrstats {G2.2, G2.6, G2.16} Checking class, type, NaN handling

  checkmate::assert_int(x = digits, lower = 1, null.ok = TRUE)
  checkmate::qassert(x, "n[0,)")
#' @srrstats {G2.13, G2.14, G2.14a, G2.14b, G2.15} Handling of missing values
  if (!is.logical(na.rm) || !length(na.rm) == 1 || is.na(na.rm)) {
    stop("`na.rm` in `concstats_top` must be either TRUE or FALSE")
  }

  if (na.rm == TRUE && anyNA(x)) {
    message("`x` has NA values. NAs have been removed for computation.")
    x <- x[!is.na(x)]
  }

  if (!na.rm && anyNA(x)) return(NA_real_)

  x <- as.numeric(x / sum(x, na.rm = TRUE))

  # check sum of vector. Must sum to 1 if all x(market share) < 1
  if (!isTRUE(all.equal(sum(x, na.rm = TRUE),
                        1, tolerance = .Machine$double.eps^0.25))) {
    stop(" Your input vector `x` in `concstats_top` does not sum to 1")
  }

  x <- as.numeric(x / sum(x, na.rm = TRUE))
  x <- sort(x, decreasing = TRUE)
  top <- as.numeric(x[1], na.rm = TRUE) * 100
  if (!is.null(digits)) top <- as.numeric(round(top, digits = digits))
  return(as.numeric(top))
}
