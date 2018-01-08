#' @title full_join
#' @description Full join between two dataframes.
#'
#' @param dtf_data A dataframe.
#' @param ... Other arguments, see full_join from dtplyr.
#'
#' @return Full join result dataframe.
#'
#' @importFrom utils capture.output
#' @importFrom dplyr full_join
#'
#' @export

full_join <- function(dtf_data, ...){

  lst_args <- base::as.list(base::match.call())
  dtlngLog(lst_args = lst_args,
           str_action = "FULL_JOIN",
           int_pf = 6)


  return(dplyr::full_join(dtf_data, ...))
}
