#' @title newAssignOps
#' @description Definition of the new assignment operator for dataframes.
#'
#' @param x The name of the new variable.
#' @param y The value to be assigned to x.
#'
#' @return Creation of the variable x in the current environment.
#'
#' @importFrom utils capture.output
#' @importFrom dplyr is_grouped_df
#'
#' @export

"myAssign" <- function(x, y){

  if (ifelse(dplyr::is_grouped_df(y), TRUE, base::class(y) == "data.frame") &
      base::exists("data_lineage_log", envir = globalenv())){


    base::assign("data_lineage_log",
                 c(base::get("data_lineage_log", envir = globalenv()),
                   base::paste0("ENVIRONMENT ",
                                utils::capture.output(base::parent.frame(n = 5)),
                                " >>> CREATE ",
                                base::deparse(base::substitute(x)),
                                " ###")),
                 envir = globalenv())

  }


  base::assign(base::deparse(base::substitute(x)), y, envir = base::parent.frame())
}
