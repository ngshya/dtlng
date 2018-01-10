#' @title startDataLineage
#' @description Initialize the data chains.
#'
#' @export


startDataLineage <- function(){
  if(base::exists("data_lineage_log", envir = base::globalenv())){
    base::rm("data_lineage_log", envir = base::globalenv())
  }
  base::assign("data_lineage_log",
               data.frame(
                 ID_DATAFRAME = "---",
                 ID_COLUMN = "---",
                 FROM_DATAFRAMES = "---",
                 FROM_COLUMNS = "---",
                 TO_DATAFRAMES = "---",
                 TO_COLUMNS = "---",
                 ACTION = "---",
                 ARGUMENTS = "---",
                 COLUMNS = "---",
                 stringsAsFactors = FALSE
               ),
               envir = globalenv())
  base::assign("%<-%", dtlng::myAssign, envir = globalenv())
}
