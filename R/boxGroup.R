#' boxplot by groups.
#'
#' boxGroup generate boxplots to compare groups with ggplot2 library.
#'
#' @param data a dataframe.
#' @param x a column name of numeric vector in dataframe which means y.
#' @param g a column name of factor vector in dataframe which means group.
#'
#' @examples
#'  cut1 <- ageCut()
#'  cut2 <- ageCut()
#'
#' @export
boxGroup <- function(data, x, g){
  data <- as.data.frame(data)
  if(class(data[,x]) != "numeric"){
    warning("Invalid class. \n Vecter x converted as numeric.")
    data[,x] <- as.numeric(data[,x])
  }
  if(class(data[,g]) != 'factor'){
    warning("Invalid class. \n Vecter g converted as factor.")
    data[,g] <- as.factor(data[,g])
  }

  boxs <- ggplot2::ggplot() +
    ggplot2::geom_boxplot(data = data, ggplot2::aes_string(x = g, y = x, fill = g)) +
    ggplot2::theme_minimal()

  return(boxs)
}
