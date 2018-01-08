#' @title mutate_
#' @description Create new columns or overwrite old ones.
#'
#' @param dtf_data A dataframe.
#' @param ... Other arguments, see mutate_ from dtplyr.
#'
#' @return Dataframe with new/modified columns.
#'
#' @importFrom utils capture.output
#' @importFrom dplyr mutate_
#'
#' @export

mutate_ <- function(dtf_data, ...){


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
                                  " >>> MUTATE ",
                                  str_4_log,
                                  " ###")),
                   envir = base::globalenv())

    }


  return(dplyr::mutate_(dtf_data, ...))
}
