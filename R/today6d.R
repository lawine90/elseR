#' Generate 6-digits string of today.
#'
#' today6d generate 6-digits string which indicate current day.
#'
#' @param with_time if TRUE, generate 10-digit string of current time.
#'
#' @examples
#'  d1 <- today6d()
#'  d2 <- today6d(with_time = TRUE)
#'
#' @export
today6d <- function(with_time = FALSE){
  if(with_time){
    return(gsub('^\\d{2}|-|:|\\d{2}$|\\s', '', as.character(Sys.time())))
  }else{
    return(gsub('^\\d{2}|-', '', as.character(Sys.Date())))
  }
}
