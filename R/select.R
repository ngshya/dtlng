#' @title select_
#' @description Select columns from a dfi.
#'
#' @param x A dfi.
#' @param ... Other arguments, see select_ from dplyr.
#'
#' @return A dfi containing selected columns from the one in input.
#'
#' @importFrom dplyr select_
#'
#' @export

select_ = function(x, ...){

  dataframe <- dplyr::select_(x$dataframe, ...)

  data_lineage <- x$data_lineage

  new_columns <- base::list()
  for (str_col in base::names(dataframe)){
    new_columns[[str_col]] <- base::list(
      base::list(
        from_dfi_id = x$id,
        from_columns = c(str_col),
        action = "SELECT",
        comment = ""
      )
    )
  }

  new_dfi <- dtlng::newDfi(old_dfi = x,
                           new_dataframe = dataframe,
                           new_name = "",
                           new_columns = new_columns)

  base::return(new_dfi)
}
