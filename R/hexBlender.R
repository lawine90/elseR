#' Blend two colors using hex codes.
#'
#' hexBlender function blend two colors of hex code and generate new hex code.
#'
#' @param color1 character value of hex code. no default.
#' @param color2 character value of hex code. no default.
#' @param alpha float value from over 0 and under 1. Default value set as 0.5.
#'
#' @examples
#'  new_hex <- hexBlender('#FF0000', '#000000')
#'
#' @export
hexBlender <- function(color1, color2, alpha = 0.5){
  col1_rgb <- colorspace::hex2RGB(color1)
  col2_rgb <- colorspace::hex2RGB(color2)

  result_rgb <- colorspace::mixcolor(
    alpha,
    colorspace::RGB(col1_rgb@coords[,1],
                    col1_rgb@coords[,2],
                    col1_rgb@coords[,3]),
    colorspace::RGB(col2_rgb@coords[,1],
                    col2_rgb@coords[,2],
                    col2_rgb@coords[,3]))

  result_hex <- grDevices::rgb(result_rgb@coords[,1]*255,
                               result_rgb@coords[,2]*255,
                               result_rgb@coords[,3]*255,
                               maxColorValue = 255)
  return(result_hex)
}
