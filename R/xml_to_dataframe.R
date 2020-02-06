#' Convert object which class is 'xml_nodeset' to data.frame.
#'
#' xml_to_dataframe() convert xml_nodeset object to data.frame.
#'
#' @param nodeset a dataframe.
#'
#' @examples
#' xml <- "<?xml  version='1.0' encoding='UTF-8'?>
#' <response>
#'   <header>
#'     <resultMsg>NORMAL SERVICE</resultMsg>
#'   </header>
#'   <body>
#'     <items>
#'       <item>
#'         <num>1</num>
#'         <date>20160413</date>
#'         <title>test_title1</title>
#'         <code>0</code>
#'         <time>08:23</time>
#'       </item>
#'       <item>
#'         <num>2</num>
#'         <date>20160414</date>
#'         <title>test_title2</title>
#'         <code>2</code>
#'         <time>22:23</time>
#'       </item>
#'       <item>
#'         <num>3</num>
#'         <date>20200415</date>
#'         <title>test_title3</title>
#'         <code>7</code>
#'         <time>20:47</time>
#'       </item>
#'     </items>
#'     <numOfRows>3</numOfRows>
#'     <pageNo>1</pageNo>
#'     <totalCount>3</totalCount>
#'   </body>
#' </response>"
#'
#' doc <- xml2::read_xml(xml)
#' items <- xml2::xml_find_all(doc, '//item')
#' df <- xml_to_dataframe(items)
#'
#' @export
xml_to_dataframe <- function(nodeset){
  if(class(nodeset) != 'xml_nodeset'){
    stop('Input should be "xml_nodeset" class')
  }
  lst <- lapply(nodeset, function(x){
    tmp <- xml2::xml_text(xml2::xml_children(x))
    names(tmp) <- xml2::xml_name(xml2::xml_children(x))
    return(as.list(tmp))
  })
  result <- do.call(plyr::rbind.fill, lapply(lst, function(x)
    as.data.frame(x, stringsAsFactors = F)))
  return(dplyr::as.tbl(result))
}
