#' @title dlin
#' @description Data lineage chain: import a dataframe from inside a function.
#'
#' @param x A dataframe.
#'
#' @return The same dataframe in input.
#'
#' @importFrom utils capture.output
#'
#' @export


dlin <- function(x){

  if(ifelse(dplyr::is_grouped_df(x), TRUE, base::class(x) == "data.frame")){

    lst_args <- base::list("", "", base::deparse(base::substitute(x)))
    dtlngLog(lst_args = lst_args,
             str_action = "IMPORT",
             int_pf = 5,
             str_cols = base::colnames(x))

  }

  base::return(x)
}
