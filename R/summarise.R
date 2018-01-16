#' @title summarise_
#' @description Summarise rows from a dfi.
#'
#' @param x A dfi.
#' @param ... Other arguments, see summarise_ from dplyr.
#'
#' @return A dfi containing summarised rows from the one in input.
#'
#' @importFrom dplyr summarise_
#'
#' @export

summarise_ <- function(x, ...){

  dataframe <- dplyr::summarise_(x$dataframe, ...)
  new_id <- dtlng::getDfiId()
  new_lng <- base::list()

  str_new_cols <- base::names(dataframe)
  lst_args <- base::as.list(base::match.call())
  str_summarise_cols <- base::names(lst_args)[c(-1, -2)]
  str_summarised_cols <- c()
  str_old_cols <- base::names(x$dataframe)
  str_old_cols <- str_old_cols[base::order(-base::nchar(str_old_cols))]

  for (str_col in str_summarise_cols){

    str_rhs <- base::deparse(lst_args[[str_col]])
    str_rhs_original <- str_rhs

    for (str_old_col in base::unique(c(str_old_cols, str_summarise_cols))){

      if(base::grepl(pattern = str_old_col, x = str_rhs)){

        str_rhs <- base::gsub(pattern = str_old_col, replacement = "", x = str_rhs)

        new_lng[[length(new_lng)+1]] <-
          base::data.frame(
            ID = new_id,
            NAME = "",
            COLUMNS = str_col,
            FROM_ID = base::ifelse(str_old_col %in% str_summarised_cols, new_id, x$id),
            FROM_COLUMNS = str_old_col,
            ACTION =  "SM",
            COMMENT = str_rhs_original,
            stringsAsFactors = FALSE
          )

        str_summarised_cols <- c(str_summarised_cols, str_col)
      }


    }

  }

  for (str_col in base::setdiff(str_new_cols, str_summarise_cols)){

    new_lng[[length(new_lng)+1]] <-
      base::data.frame(
        ID = new_id,
        NAME = "",
        COLUMNS = str_col,
        FROM_ID = x$id,
        FROM_COLUMNS = str_col,
        ACTION =  "SM",
        COMMENT = "NOT MUTATED",
        stringsAsFactors = FALSE
      )

  }

  new_lng <- base::do.call(rbind, new_lng)

  new_dfi <- dtlng::newDfi(new_dataframe = dataframe,
                           new_id = new_id,
                           new_name = "",
                           new_lng = new_lng)

  base::return(new_dfi)
}
