#' @title mutate_
#' @description Create new columns or overwrite old ones.
#'
#' @param dtf_data A dataframe.
#' @param ... Other arguments, see mutate_ from dtplyr.
#'
#' @return Dataframe with new/modified columns.
#'
#' @importFrom utils capture.output
#' @importFrom dplyr mutate_
#'
#' @export

mutate_ <- function(dtf_data, ...){

  lst_args <- base::as.list(base::match.call())
  dtlngLog(lst_args = lst_args,
           str_action = "MUTATE",
           int_pf = 6)

  return(dplyr::mutate_(dtf_data, ...))
}
