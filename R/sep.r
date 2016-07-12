#' sep
#' 
#' Split one deque into two deques. Unlike most dequer functions, this one
#' has a return!
#' 
#' @details
#' Operates via side-effects ALTHOUGH THERE IS A NON-NULL RETURN; see examples
#' for clarification on usage.
#' 
#' The split occurs after index k.  So if the input x has, say,
#' elements 1 to n, then after running \code{sep(x, k)}, x will
#' have elements 1 to k, and the return will have values
#' k+1, k+2, ..., n.
#' 
#' @param x
#' A deque.
#' @param k
#' Index to split the deque at.
#' 
#' @return
#' A deque, stack, or queue (depending on the input)
#' 
#' @examples
#' \dontrun{
#' library(dequer)
#' d <- deque()
#' for (i in 1:5) push(d, i)
#' 
#' ### Split d into 2 deques
#' d_last_2 <- sep(d, 3)
#' 
#' ### d now holds the first 3 elements
#' print(d, output="full")
#' print(d_last_5, output="full")
#' }
#' 
#' @export
sep <- function(x, k)
{
  if (!(class(x) %in% CLASSES))
    stop("'x' must be a deque, stack, or queue.")
  if (!is.numeric(k) || abs(k-round(k)) > 1e-12 || k < 1)
    stop("'k' must be a positive integer")
  
  if (k >= length(x))
    stop("'k' must be less than length(x)")
  
  ret <- .Call(R_deque_split, x, as.integer(k))
  class(ret) <- "deque"
  
  ret
}
