#' Some function
#'
#'  dont skip me
#'
#' @param envir an environment
#' @rdname eapply
#' @export
eapply_noOut <- function(envir){
  .Call(R_eapply_noOut,envir)
}
