#' @title inner_join
#' @description Inner join between two dataframes.
#'
#' @param dtf_data A dataframe.
#' @param ... Other arguments, see inner_join from dtplyr.
#'
#' @return Inner join result dataframe.
#'
#' @importFrom utils capture.output
#' @importFrom dplyr inner_join
#'
#' @export

inner_join <- function(dtf_data, ...){

  lst_args <- base::as.list(base::match.call())
  dtlngLog(lst_args = lst_args,
           str_action = "INNER_JOIN",
           int_pf = 6)


  return(dplyr::inner_join(dtf_data, ...))
}
