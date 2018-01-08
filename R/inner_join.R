#' @title inner_join
#' @description Inner join between two dataframes.
#'
#' @param dtf_data A dataframe.
#' @param ... Other arguments, see inner_join from dtplyr.
#'
#' @return Inner join result dataframe.
#'
#' @importFrom utils capture.output
#' @importFrom dplyr inner_join
#'
#' @export

inner_join <- function(dtf_data, ...){

    if(base::exists("data_lineage_log", envir = base::globalenv())){

      base::assign("data_lineage_log",
                   c(base::get("data_lineage_log", envir = base::globalenv()),
                     base::paste0("ENVIRONMENT ",
                                  utils::capture.output(base::parent.frame(n = 6)),
                                  " >>> INNER_JOIN ",
                                  gsub(pattern = '\"',
                                       replacement = "",
                                       base::paste0(base::match.call()[-(1:2)],
                                                    collapse = " ")),
                                  " ###")),
                   envir = base::globalenv())

    }


  return(dplyr::inner_join(dtf_data, ...))
}
