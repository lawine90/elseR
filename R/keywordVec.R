#' Count elements in vector and make it as one string.
#'
#' keywordVec count all elements in vector. Please refer example.
#'
#' @param x vector of characters.
#' @param reverse logical. If true, convert string value to vectors.
#' @param limit .
#'
#' @examples
#'  count <- keywordVec(as.character(c(1,1,2,2,1,2,1,2,1,5,5,5,3,6,5,3,5)))
#'  reverse <- keywordVec(count, reverse = T)
#'
#' @export
keywordVec <- function(x, reverse = F, limit = NULL){
  if(class(x) != "character"){
    stop("Invalid class. \n Please insert character vecter x.")
  }
  if(!is.null(limit) & reverse){
    stop("Invalid reverse and limit parameter. \n Parameter limit should be null if parameter reverse is TRUE.")
  }

  if(reverse == F){
    if(length(x) == 0){
      return("")
    }else if( all(grepl("\\(\\d{1,3}\\)", x)) ){
      stop("Inappropriate vector. \n Input x is already counted vector. Please set \"reverse\" as T")
    }else{
      x.tbl <- as.data.frame.table(table(x))
      x.tbl <- x.tbl[order(x.tbl$Freq, decreasing = T),]

      limit <- c(limit, nrow(x.tbl))[which.min(c(limit, nrow(x.tbl)))]
      if(!is.null(limit)) x.tbl <- x.tbl[1:limit,]
      result <- paste(x.tbl$x, "(", x.tbl$Freq, ")", sep = "", collapse = "; ")
    }
  }else{
    if(length(x) != 1){
      stop("Inappropriate vector. \n Input x is raw vector. Please set \"reverse\" as F")
    }

    x.splt <- unlist(strsplit(x, "; "))
    result <- rep(gsub("\\(.*", "", x.splt), as.numeric(gsub(".*\\(|\\)", "", x.splt)))
  }

  return(result)
}
