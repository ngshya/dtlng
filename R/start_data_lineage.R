#' @title startDataLineage
#' @description Initialize the data chains.
#'
#' @export


startDataLineage <- function(){
  if(base::exists("data_lineage_log", envir = base::globalenv())){
    base::rm("data_lineage_log", envir = base::globalenv())
  }
  base::assign("data_lineage_log", "NEW DATA LINEAGE LOG", envir = globalenv())
  base::assign("%<-%", dtlng::myAssign, envir = globalenv())
}
