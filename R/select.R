#' @title select_
#' @description Select columns from a dfi.
#'
#' @param x A dfi.
#' @param ... Other arguments, see select_ from dplyr.
#'
#' @return A dfi containing selected columns from the one in input.
#'
#' @importFrom dplyr select_
#'
#' @export

select_ <- function(x, ...){

  dataframe <- dplyr::select_(x$dataframe, ...)
  new_id <- dtlng::getDfiId()
  new_lng <- base::list()

  lng <- base::data.frame(
    ID = new_id,
    NAME = "",
    COLUMNS = base::names(dataframe),
    FROM_ID = x$id,
    FROM_COLUMNS = base::names(dataframe),
    ACTION = "S",
    COMMENT = "",
    stringsAsFactors = FALSE
  )

  new_dfi <- dtlng::newDfi(new_dataframe = dataframe,
                           new_id = new_id,
                           new_name = "",
                           new_lng = lng)

  base::return(new_dfi)
}
