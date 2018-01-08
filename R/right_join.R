#' @title right_join
#' @description Right join between two dataframes.
#'
#' @param dtf_data A dataframe.
#' @param ... Other arguments, see right_join from dtplyr.
#'
#' @return Right join result dataframe.
#'
#' @importFrom utils capture.output
#' @importFrom dplyr right_join
#'
#' @export

right_join <- function(dtf_data, ...){

  if(base::exists("data_lineage_log", envir = globalenv())){

    base::assign("data_lineage_log",
                 c(base::get("data_lineage_log", envir = globalenv()),
                   base::paste0("ENVIRONMENT ",
                                utils::capture.output(base::parent.frame(n = 6)),
                                " >>> RIGHT_JOIN ",
                                gsub(pattern = '\"',
                                     replacement = "",
                                     base::paste0(base::match.call()[-(1:2)],
                                                  collapse = " ")),
                                " ###")),
                 envir = globalenv())

  }


  return(dplyr::right_join(dtf_data, ...))
}
