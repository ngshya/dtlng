#' @title group_by_
#' @description Groupby a dataframe.
#'
#' @param dtf_data A dataframe.
#' @param ... Other arguments, see group_by_ from dtplyr.
#'
#' @return Grouped dataframe.
#'
#' @importFrom utils capture.output
#' @importFrom dplyr group_by_
#'
#' @export

group_by_ <- function(dtf_data, ...){


  lst_args <- base::as.list(base::match.call())
  dtlngLog(lst_args = lst_args,
           str_action = "GROUP_BY",
           int_pf = 6)


  return(dplyr::group_by_(dtf_data, ...))
}
