#' @title asDfi
#' @description Transform a dataframe in a dfi.
#'
#' @param x A dataframe.
#' @param str_name (optional) The name of the new dfi.
#'
#' @return A dfi with the desired name.
#'
#' @export

asDfi <- function(x, str_name){
  if(base::missing(str_name)){str_name <- ""}
  base::return(dfi$new(dataframe = x, name = str_name))
}
