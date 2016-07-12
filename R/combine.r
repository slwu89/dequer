#' combine
#' 
#' Combine two deques into one deque.
#' 
#' @details
#' Operates via side-effects; see examples for clarification on usage.
#' 
#' @examples
#' library(dequer)
#' d <- deque()
#' push(d, 1)
#' push(d, 2)
#' popback(d)
#' print(d, output="full")
#' 
#' @param x1,x2
#' Two different deques, stacks, or queues. Arguments must be of the same type.
#' 
#' @return
#' Returns \code{NULL}. After combining, object \code{x2} is a 0-length (empty)
#' object.
#' 
#' @examples
#' \dontrun{
#' library(dequer)
#' d1 <- deque()
#' for (i in 1:5) push(d1, i)
#' d2 <- deque()
#' for (i in 10:8) push(d2, i)
#' 
#' combine(d1, d2)
#' }
#' 
#' @export
combine <- function(x1, x2)
{
  if (!(class(x1) %in% CLASSES))
    stop("'x1' must be a deque, stack, or queue.")
  if (!(class(x2) %in% CLASSES))
    stop("'x2' must be a deque, stack, or queue.")
  if (class(x1) != class(x2))
    stop("'x1' and 'x2' must be the same class")
  
  .Call(R_deque_combine, x1, x2)
  invisible()
}