#' @title full_join
#' @description Full join between two dfi.
#'
#' @param x A dfi.
#' @param y A dfi.
#' @param by Columns to join.
#' @param ... Other arguments, see full_join from dplyr.
#'
#' @return Full join result dfi.
#'
#' @importFrom dplyr full_join
#'
#' @export

full_join = function(x, y, by, ...){

  str_r_cols_j <- by
  base::names(str_r_cols_j) <- NULL
  if(base::length(base::names(by)) == 0){
    str_l_cols_j <- str_r_cols_j
    base::names(by) <- str_r_cols_j
  } else {
    str_l_cols_j <- base::names(by)
  }
  str_l_cols_nj <- base::setdiff(base::names(x$dataframe), str_l_cols_j)
  str_r_cols_nj <- base::setdiff(base::names(y$dataframe), str_r_cols_j)

  if(base::length(base::intersect(str_l_cols_nj, str_r_cols_nj)) > 0){
    error("Same column appears in both dataframes!")
  }

  dataframe <- dplyr::full_join(x$dataframe, y$dataframe, by = by, ...)

  data_lineage <- c(x$data_lineage, y$data_lineage)[base::union(base::names(x$data_lineage), base::names(y$data_lineage))]

    new_columns <- base::list()
  for (str_col in base::names(dataframe)){

    if(str_col %in% str_l_cols_nj){
      new_columns[[str_col]] <- base::list(
        base::list(
          from_dfi_id = x$id,
          from_columns = c(str_col),
          action = "FULL_JOIN",
          comment = "LEFT DATAFRAME, NOT A JOIN COLUMN"
        )
      )
    } else if (str_col %in% str_r_cols_nj) {
      new_columns[[str_col]] <- base::list(
        base::list(
          from_dfi_id = y$id,
          from_columns = c(str_col),
          action = "FULL_JOIN",
          comment = "RIGHT DATAFRAME, NOT A JOIN COLUMN"
        )
      )
    } else if (str_col %in% str_l_cols_j){
      new_columns[[str_col]] <- base::list(
        base::list(
          from_dfi_id = x$id,
          from_columns = c(str_col),
          action = "FULL_JOIN",
          comment = "LEFT DATAFRAME, JOIN COLUMN"
        ),
        base::list(
          from_dfi_id = y$id,
          from_columns = c(base::as.character(by[str_col])),
          action = "FULL_JOIN",
          comment = "RIGHT DATAFRAME, JOIN COLUMN"
        )
      )
    }

  }

  new_dfi <- dtlng::newDfi(old_data_lineage = data_lineage,
                           new_dataframe = dataframe,
                           new_name = "",
                           new_columns = new_columns)

  base::return(new_dfi)

  #return(dataframe)
}
