#' @title right_join
#' @description Right join between two dfi.
#'
#' @param x A dfi.
#' @param y A dfi.
#' @param by Columns to join.
#' @param ... Other arguments, see right_join from dplyr.
#'
#' @return Right join result dfi.
#'
#' @importFrom dplyr right_join
#'
#' @export

right_join = function(x, y, by, ...){

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

  dataframe <- dplyr::right_join(x$dataframe, y$dataframe, by = by, ...)
  new_id <- dtlng::getDfiId()
  new_lng <- base::list()
  for (str_col in base::names(dataframe)){

    if(str_col %in% str_l_cols_nj){

      new_lng[[length(new_lng)+1]] <-
        base::data.frame(
          ID = new_id,
          NAME = "",
          COLUMNS = str_col,
          FROM_ID = x$id,
          FROM_COLUMNS = str_col,
          ACTION =  base::paste("RJ", x$name, y$name),
          COMMENT = "LEFT DATAFRAME, NOT A JOIN COLUMN",
          stringsAsFactors = FALSE
        )

    } else if (str_col %in% str_r_cols_nj) {

      new_lng[[length(new_lng)+1]] <-
        base::data.frame(
          ID = new_id,
          NAME = "",
          COLUMNS = str_col,
          FROM_ID = y$id,
          FROM_COLUMNS = str_col,
          ACTION =  base::paste("RJ", x$name, y$name),
          COMMENT = "RIGHT DATAFRAME, NOT A JOIN COLUMN",
          stringsAsFactors = FALSE
        )

    } else if (str_col %in% str_l_cols_j){

      new_lng[[length(new_lng)+1]] <-
        base::data.frame(
          ID = new_id,
          NAME = "",
          COLUMNS = str_col,
          FROM_ID = x$id,
          FROM_COLUMNS = str_col,
          ACTION =  base::paste("RJ", x$name, y$name),
          COMMENT = "LEFT DATAFRAME, JOIN COLUMN",
          stringsAsFactors = FALSE
        )

      new_lng[[length(new_lng)+1]] <-
        base::data.frame(
          ID = new_id,
          NAME = "",
          COLUMNS = str_col,
          FROM_ID = y$id,
          FROM_COLUMNS = c(base::as.character(by[str_col])),
          ACTION = base::paste("RJ", x$name, y$name),
          COMMENT = "RIGHT DATAFRAME, JOIN COLUMN",
          stringsAsFactors = FALSE
        )

    }

  }
  new_lng <- base::do.call(rbind, new_lng)

  new_dfi <- dtlng::newDfi(new_dataframe = dataframe,
                           new_id = new_id,
                           new_name = "",
                           new_lng = new_lng)

  base::return(new_dfi)
}
