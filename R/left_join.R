#' @title left_join
#' @description Left join between two dataframes.
#'
#' @param dtf_data A dataframe.
#' @param ... Other arguments, see left_join from dtplyr.
#'
#' @return Left join result dataframe.
#'
#' @importFrom utils capture.output
#' @importFrom dplyr left_join
#'
#' @export
#'
left_join <- function(dtf_data, ...){

    if(base::exists("data_lineage_log", envir = base::globalenv())){

      base::assign("data_lineage_log",
                   c(base::get("data_lineage_log", envir = base::globalenv()),
                     base::paste0("ENVIRONMENT ",
                                  utils::capture.output(base::parent.frame(n = 6)),
                                  " >>> LEFT_JOIN ",
                                  gsub(pattern = '\"',
                                       replacement = "",
                                       base::paste0(base::match.call()[-(1:2)],
                                                    collapse = " ")),
                                  " ###")),
                   envir = base::globalenv())

    }


  return(dplyr::left_join(dtf_data, ...))
}
