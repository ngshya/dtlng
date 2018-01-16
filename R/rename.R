#' @title rename_
#' @description Rename columns of a dfi.
#'
#' @param x A dfi.
#' @param .dots Vector of columns names to rename.
#'
#' @return A dfi containing renamed columns.
#'
#' @importFrom dplyr rename_
#'
#' @export

rename_ <- function(x, .dots){

  dataframe <- dplyr::rename_(x$dataframe, .dots = .dots)
  new_id <- dtlng::getDfiId()
  new_lng <- base::list()

  str_rename <- .dots
  str_new_names <- base::names(dataframe)
  str_old_names <- base::names(x$dataframe)

  new_lng <- base::data.frame(
    ID = new_id,
    NAME = "",
    COLUMNS = str_new_names,
    FROM_ID = x$id,
    FROM_COLUMNS = str_old_names,
    ACTION = "R",
    COMMENT = base::ifelse(str_new_names != str_old_names, "NEW NAME", "SAME NAME"),
    stringsAsFactors = FALSE
  )

  new_dfi <- dtlng::newDfi(new_dataframe = dataframe,
                           new_id = new_id,
                           new_name = "",
                           new_lng = new_lng)

  base::return(new_dfi)
}
