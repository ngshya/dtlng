#' @title rename_
#' @description Rename columns of a dataframe.
#'
#' @param dtf_data A dataframe.
#' @param ... Arguments for the rename_ function from dtplyr.
#'
#' @return The same dataframe in input but with new column names.
#'
#' @importFrom utils capture.output
#' @importFrom dplyr rename_
#'
#' @export

rename_ <- function(dtf_data, ...){

  lst_args <- base::as.list(base::match.call())
  dtlngLog(lst_args = lst_args,
           str_action = "RENAME",
           int_pf = 6)

  return(dplyr::rename_(dtf_data, ...))
}
