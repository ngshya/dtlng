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

  if(base::exists("data_lineage_log", envir = base::globalenv())){

    lst_args <- base::as.list(base::match.call())
    str_variables <- base::names(lst_args)
    str_values <- unlist(lst_args)
    str_4_log <- paste0(paste(str_variables, str_values, sep = " = ")[c(-1, -2)],
                        collapse = ", ")

    base::assign("data_lineage_log",
                 c(base::get("data_lineage_log", envir = base::globalenv()),
                   base::paste0("ENVIRONMENT ",
                                utils::capture.output(base::parent.frame(n = 6)),
                                " >>> SUMMARISE ",
                                str_4_log,
                                " ###")),
                 envir = base::globalenv())

  }


  return(dplyr::summarise_(dtf_data, ...))
}
