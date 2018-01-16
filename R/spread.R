#' @title spread_
#' @description Spread one column from a dfi.
#'
#' @param x A dfi.
#' @param key Key column.
#' @param value Value column.
#'
#' @return A dfi New columns created by the spread function.
#'
#' @importFrom tidyr spread_
#'
#' @export

spread_ <- function(x, key, value){

  dataframe <- tidyr::spread_(x$dataframe, key = key, value = value)
  new_id <- dtlng::getDfiId()
  new_lng <- base::list()

  str_old_cols <- base::names(x$dataframe)
  str_new_cols <- base::names(dataframe)
  str_spread_cols <- base::setdiff(str_new_cols, str_old_cols)

  for (str_col in str_new_cols){

    if(str_col %in% str_spread_cols){

      new_lng[[length(new_lng)+1]] <- base::data.frame(
        ID = new_id,
        NAME = "",
        COLUMNS = str_col,
        FROM_ID = x$id,
        FROM_COLUMNS = c(key, value),
        ACTION = "SP",
        COMMENT = base::rep(paste0("key = ", key, ", value = ", value), 2),
        stringsAsFactors = FALSE
      )

    } else {

      new_lng[[length(new_lng)+1]] <- base::data.frame(
        ID = new_id,
        NAME = "",
        COLUMNS = str_col,
        FROM_ID = x$id,
        FROM_COLUMNS = str_col,
        ACTION = "SP",
        COMMENT = "NOT SPREAD COLUMN",
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
