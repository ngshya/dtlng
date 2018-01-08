#' @title left_join
#' @description Left join between two dataframes.
#'
#' @param dtf_data A dataframe.
#' @param ... Other arguments, see left_join from dtplyr.
#'
#' @return Left join result dataframe.
#'
#' @importFrom utils capture.output
#' @importFrom dplyr left_join
#'
#' @export
#'
left_join <- function(dtf_data, ...){

  lst_args <- base::as.list(base::match.call())
  dtlngLog(lst_args = lst_args,
           str_action = "LEFT_JOIN",
           int_pf = 6)


  return(dplyr::left_join(dtf_data, ...))
}
