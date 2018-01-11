#' #' @title full_join
#' #' @description Full join between two dfi.
#' #'
#' #' @param x A dfi.
#' #' @param ... Other arguments, see full_join from dplyr.
#' #'
#' #' @return Full join result dfi.
#' #'
#' #' @importFrom dplyr full_join
#' #'
#' #' @export
#'
#' select_ = function(x, ...){
#'
#'   dataframe <- dplyr::full_join(x$dataframe, ...)
#'
#'   data_lineage <- x$data_lineage
#'
#'   new_columns <- base::list()
#'   for (str_col in base::names(dataframe)){
#'     new_columns[[str_col]] <- base::list(
#'       base::list(
#'         from_dfi_id = x$id,
#'         from_columns = c(str_col),
#'         action = "SELECT",
#'         comment = ""
#'       )
#'     )
#'   }
#'
#'   new_dfi <- dtlng::newDfi(old_dfi = x,
#'                            new_dataframe = dataframe,
#'                            new_name = "",
#'                            new_columns = new_columns)
#'
#'   base::return(new_dfi)
#' }
