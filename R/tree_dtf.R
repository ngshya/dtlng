#' @title treeDtf
#' @description Create the datalineage tree
#'
#' @return A dataframe containing the data lineage.
#'
#' @export

treeDtf <- function(){

  if(base::exists("dtlng_env", envir = base::globalenv())){
    if(base::exists("tree", envir = base::globalenv()$dtlng_env)){

      lst_tree <- base::as.list(base::get("tree", envir = base::globalenv()$dtlng_env))
      dtf_tree <- base::do.call(rbind, lst_tree)
      return(dtf_tree)

    } else {
      base::stop("tree does not exist!")
    }

  } else {
    base::stop("dtlng_env does not exist!")
  }

}
