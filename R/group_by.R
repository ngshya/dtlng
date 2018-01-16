#' @title group_by_
#' @description Group by .
#'
#' @param x A dfi.
#' @param ... Other arguments, see group_by_ from dplyr.
#'
#' @return A dfi containing grouped rows from the one in input.
#'
#' @importFrom dplyr group_by_
#'
#' @export

group_by_ <- function(x, ...){

  dataframe <- dplyr::group_by_(x$dataframe, ...)
  new_id <- dtlng::getDfiId()
  new_lng <- base::list()

  lng <- base::data.frame(
    ID = new_id,
    NAME = "",
    COLUMNS = base::names(dataframe),
    FROM_ID = x$id,
    FROM_COLUMNS = base::names(dataframe),
    ACTION = "GB",
    COMMENT = base::deparse(base::substitute(...)),
    stringsAsFactors = FALSE
  )

  new_dfi <- dtlng::newDfi(new_dataframe = dataframe,
                           new_id = new_id,
                           new_name = "",
                           new_lng = lng)

  base::return(new_dfi)
}
