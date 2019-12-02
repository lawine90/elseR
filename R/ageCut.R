#' Cut all continuous age values to categorical.
#'
#' ageCut cut all numeric age values to categorical.
#'  You can choose interval 5 or 10.
#'
#' @param x a vector which have numeric age values.
#' @param interval interval of age, between 5 or 10.
#'
#' @examples
#'  cut1 <- ageCut()
#'  cut2 <- ageCut()
#'
#' @export
ageCut <- function(x, interval = 5){
  if(class(x) != "numeric"){
    warning("Invalid class. \n Vecter x converted as numeric.")
    x <- as.numeric(x)
  }
  if(!(interval %in% c(5, 10))){
    stop("Invalid parameter. \n Parameter interval should be set between 5 or 10.")
  }

  if(interval == 5){
    cuts <- as.character(cut(x, breaks = seq(0, 100, by = 5), right = T))
  }else if(interval == 10){
    cuts <- as.character(cut(x, breaks = seq(0, 100, by = 10), right = T))
  }
  return(cuts)
}
