#' @title select_
#' @description Select a subset of columns from a dataframe.
#'
#' @param dtf_data A dataframe.
#' @param ... Arguments for the select_ function from dtplyr.
#'
#' @return The same dataframe in input but with selected columns.
#'
#' @importFrom utils capture.output
#' @importFrom dplyr select_
#'
#' @export

select_ <- function(dtf_data, ...){

  lst_args <- base::as.list(base::match.call())
  str_variables <- base::names(lst_args)
  str_values <- unlist(lst_args)
  str_4_log <- paste0(str_variables,
                             ifelse(str_variables == "", "", "="),
                             str_values)[c(-1, -2)]

  dtlngLog(lst_args = lst_args,
           str_action = "SELECT",
           int_pf = 6)

  return(dplyr::select_(dtf_data, ...))
}
