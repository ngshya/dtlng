#' @title group_by_
#' @description Groupby a dataframe.
#'
#' @param dtf_data A dataframe.
#' @param ... Other arguments, see group_by_ from dtplyr.
#'
#' @return Grouped dataframe.
#'
#' @importFrom utils capture.output
#' @importFrom dplyr group_by_
#'
#' @export

group_by_ <- function(dtf_data, ...){


    if(base::exists("data_lineage_log", envir = base::globalenv())){

      base::assign("data_lineage_log",
                   c(base::get("data_lineage_log", envir = base::globalenv()),
                     base::paste0("ENVIRONMENT ",
                                  utils::capture.output(base::parent.frame(n = 6)),
                                  " >>> GROUP_BY ",
                                  base::paste0(base::match.call()[-(1:2)],
                                               collapse = " "),
                                  " ###")),
                   envir = base::globalenv())

    }


  return(dplyr::group_by_(dtf_data, ...))
}
