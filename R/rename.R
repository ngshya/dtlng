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

  if(base::exists("data_lineage_log", envir = globalenv())){

    base::assign("data_lineage_log",
                 c(base::get("data_lineage_log", envir = globalenv()),
                   base::paste0("ENVIRONMENT ",
                                utils::capture.output(base::parent.frame(n = 6)),
                                " >>> RENAME ",
                                gsub(pattern = '\"',
                                     replacement = "",
                                     base::paste0(base::match.call()[-(1:2)],
                                                  collapse = " ")),
                                " ###")),
                 envir = globalenv())

  }

  return(dplyr::rename_(dtf_data, ...))
}
