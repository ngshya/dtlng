#' @title filter_
#' @description Filter rows from a dataframe.
#'
#' @param dtf_data A dataframe.
#' @param ... Other arguments, see filter_ from dtplyr.
#'
#' @return Filtered dataframe.
#'
#' @importFrom utils capture.output
#' @importFrom dplyr filter_
#'
#' @export

filter_ <- function(dtf_data, ...){

  lst_args <- base::as.list(base::match.call())
  dtlngLog(lst_args = lst_args,
           str_action = "FILTER",
           int_pf = 6)

  return(dplyr::filter_(dtf_data, ...))
}
