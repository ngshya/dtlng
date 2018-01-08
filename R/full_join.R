#' @title full_join
#' @description Full join between two dataframes.
#'
#' @param dtf_data A dataframe.
#' @param ... Other arguments, see full_join from dtplyr.
#'
#' @return Full join result dataframe.
#'
#' @importFrom utils capture.output
#' @importFrom dplyr full_join
#'
#' @export

full_join <- function(dtf_data, ...){

    if(base::exists("data_lineage_log", envir = base::globalenv())){

      base::assign("data_lineage_log",
                   c(base::get("data_lineage_log", envir = base::globalenv()),
                     base::paste0("ENVIRONMENT ",
                                  utils::capture.output(base::parent.frame(n = 6)),
                                  " >>> FULL_JOIN ",
                                  gsub(pattern = '\"',
                                       replacement = "",
                                       base::paste0(base::match.call()[-(1:2)],
                                                    collapse = " ")),
                                  " ###")),
                   envir = base::globalenv())

    }


  return(dplyr::full_join(dtf_data, ...))
}
