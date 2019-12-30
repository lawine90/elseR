#' Count all combinations of elements in vector and make it as dataframe.
#'
#' keywordComb count all combinations of elements in vector.
#'  Usually, this function used for network analysis when calculate weight between nodes(or vertexs).
#'  Please refer more details from github or example.
#'
#' @param x a vector which have more than m element(length(x) >= m).
#' @param m a number of combination. Default set as 2.
#' @param remove_dup if TRUE, use only unique elements in vectors(which means remove duplicates).
#' @param self_conn if TRUE, allow nodes which have a self-connection, meaning an edge from itself to itself.
#'
#' @examples
#'  comb2 <- keywordComb(as.character(c(1,1,2,2,1,5,5,3,6,5,3,5)),
#'                       m = 2, remove_dup = FALSE, self_conn = FALSE)
#'  comb3 <- keywordComb(as.character(c(1,1,2,2,1,5,5,3,6,5,3,5)),
#'                       m = 3, remove_dup = FALSE, self_conn = TRUE)
#'
#' @export
keywordComb <- function(x, m = 2, remove_dup = F, self_conn = F){
  if(class(x) != "character"){
    stop("Invalid class. \n Please insert character vecter x.")
  }
  if(length(x) < m){
    stop("Invalid parameter. \n Parameter m should not exceed length of input vector x.")
  }

  if(remove_dup){x <- unique(x)}
  comb <- as.data.frame(t(utils::combn(x, m)), stringsAsFactors = F)
  comb <- dplyr::as.tbl(comb); colnames(comb) <- paste('word', 1:m, sep = '')
  comb <- dplyr::mutate(comb, value = 1)
  comb <- dplyr::group_by(comb, .dots = paste('word', 1:m, sep = ''))
  comb <- dplyr::summarise_all(comb, sum)
  comb <- dplyr::ungroup(comb)

  if(!self_conn){
    comb <- comb[apply(comb[,paste('word', 1:m, sep = '')], 1, function(x) length(unique(x)) != 1),]
  }

  return(comb)
}
