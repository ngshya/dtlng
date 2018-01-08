#' @title right_join
#' @description Right join between two dataframes.
#'
#' @param dtf_data A dataframe.
#' @param ... Other arguments, see right_join from dtplyr.
#'
#' @return Right join result dataframe.
#'
#' @importFrom utils capture.output
#' @importFrom dplyr right_join
#'
#' @export

right_join <- function(dtf_data, ...){

  lst_args <- base::as.list(base::match.call())
  dtlngLog(lst_args = lst_args,
           str_action = "RIGHT_JOIN",
           int_pf = 6)

  return(dplyr::right_join(dtf_data, ...))
}
