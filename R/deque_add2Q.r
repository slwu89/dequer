#' @rdname pushing
#' @export
add2Q <- function(x, data) UseMethod("add2Q")

#' @rdname pushing
#' @export
add2Q.deque <- function(x, data) invisible(.Call(R_deque_add2Q, x, data))
