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

  if(base::exists("data_lineage_log", envir = globalenv())){

    base::assign("data_lineage_log",
                 c(base::get("data_lineage_log", envir = globalenv()),
                   base::paste0("ENVIRONMENT ",
                                utils::capture.output(base::parent.frame(n = 6)),
                                " >>> SELECT ",
                                gsub(pattern = '\"',
                                     replacement = "",
                                     base::paste0(base::match.call()[-(1:2)],
                                                  collapse = " ")),
                                " ###")),
                 envir = globalenv())

  }


  return(dplyr::select_(dtf_data, ...))
}
