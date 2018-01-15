#' @title filter_
#' @description Filter rows from a dfi.
#'
#' @param x A dfi.
#' @param ... Other arguments, see filter_ from dplyr.
#'
#' @return A dfi containing selected rows from the one in input.
#'
#' @importFrom dplyr filter_
#'
#' @export

filter_ <- function(x, ...){

  dataframe <- dplyr::filter_(x$dataframe, ...)
  new_id <- dtlng::getDfiId()
  new_lng <- base::list()

  lng <- base::data.frame(
    ID = new_id,
    NAME = "",
    COLUMNS = base::names(dataframe),
    FROM_ID = x$id,
    FROM_COLUMNS = base::names(dataframe),
    ACTION = "F",
    COMMENT = base::deparse(base::substitute(...)),
    stringsAsFactors = FALSE
  )

  new_dfi <- dtlng::newDfi(new_dataframe = dataframe,
                           new_id = new_id,
                           new_name = "",
                           new_lng = lng)

  base::return(new_dfi)
}
