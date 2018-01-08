#' @title dl
#' @description Add the starting dataframe into the data lineage chain.
#'
#' @param x A dataframe.
#'
#' @return The same dataframe in input.
#'
#' @importFrom utils capture.output
#'
#' @export


dl <- function(x){

  if(base::class(x) == "data.frame"){

    lst_args <- base::list("", "", base::deparse(base::substitute(x)))
    dtlngLog(lst_args = lst_args,
             str_action = "FROM",
             int_pf = 5)

  }

  base::return(x)
}
