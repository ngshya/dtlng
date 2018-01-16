#' @title view
#' @description view()
#'
#' @param x A dfi.
#' @param title title for viewer window. Defaults to name of x prefixed by Data:.
#'
#' @return Show the dataframe inside the dfi.
#'
#' @importFrom utils View
#'
#' @export

view <- function(x, title){
  utils::View(x$dataframe, title = title)
}
