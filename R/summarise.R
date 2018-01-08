#' @title summarise_
#' @description Summerise a grouped dataframe.
#'
#' @param dtf_data A dataframe.
#' @param ... Arguments of the function summerise_ from dtplyr.
#'
#' @return Transformed dataframe.
#'
#' @importFrom utils capture.output
#' @importFrom dplyr summarise_
#'
#' @export

summarise_ <- function(dtf_data, ...){

  lst_args <- base::as.list(base::match.call())
  dtlngLog(lst_args = lst_args,
           str_action = "SUMMARISE",
           int_pf = 6)

  return(dplyr::summarise_(dtf_data, ...))
}
