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

  if (ifelse(dplyr::is_grouped_df(y), TRUE, base::class(y) == "data.frame")){

    lst_args <- base::list("", "", base::deparse(base::substitute(x)))
    dtlngLog(lst_args = lst_args,
             str_action = "CREATE",
             int_pf = 5)

  }

  base::invisible(base::assign(base::deparse(base::substitute(x)), y, envir = base::parent.frame()))

}
