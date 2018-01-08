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

  if(base::class(x) == "data.frame" &
     base::exists("data_lineage_log", envir = base::globalenv()) ){

    base::assign("data_lineage_log",
                 c(base::get("data_lineage_log", envir = base::globalenv()),
                   base::paste0("ENVIRONMENT ",
                                utils::capture.output(base::parent.frame(n = 5)),
                                " >>> FROM ",
                                base::deparse(base::substitute(x)),
                                " ###")),
                 envir = base::globalenv())

  }

  base::return(x)
}
