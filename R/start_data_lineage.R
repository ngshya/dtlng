#' @title startDataLineage
#' @description Initialize the data chains.
#'
#' @export


startDataLineage <- function(){
  if(base::exists("data_lineage_log", envir = base::globalenv())){
    base::rm("data_lineage_log", envir = base::globalenv())
  }
  base::assign("data_lineage_log",
               data.frame(ENV = "---",
                          ACTION = "---",
                          ARGUMENTS = "---",
                          stringsAsFactors = FALSE),
               envir = globalenv())
  base::assign("%<-%", dtlng::myAssign, envir = globalenv())
}
