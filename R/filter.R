#' @title filter_
#' @description Filter rows from a dataframe.
#'
#' @param dtf_data A dataframe.
#' @param ... Other arguments, see filter_ from dtplyr.
#'
#' @return Filtered dataframe.
#'
#' @importFrom utils capture.output
#' @importFrom dplyr filter_
#'
#' @export

filter_ <- function(dtf_data, ...){

  if(base::exists("data_lineage_log", envir = base::globalenv())){



    base::assign("data_lineage_log",
                 c(base::get("data_lineage_log", envir = base::globalenv()),
                   base::paste0("ENVIRONMENT ",
                                utils::capture.output(base::parent.frame(n = 6)),
                                " >>> FILTER ",
                                base::paste0(base::match.call()[-(1:2)],
                                             collapse = " "),
                                " ###")),
                 envir = base::globalenv())

  }

  return(dplyr::filter_(dtf_data, ...))
}
