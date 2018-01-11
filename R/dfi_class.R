#' @export

dfi <- R6::R6Class(

  "dfi",

  public = base::list(

    dataframe = NULL,
    id = NULL,
    name = NULL,
    data_lineage = NULL,

    initialize = function(dataframe = dplyr::data.frame(),
                          id = dtlng::getDfiId(),
                          name = "",
                          data_lineage){

      self$dataframe <- dataframe
      self$id <- id
      self$name <- name

      if(base::missing(data_lineage)){
        self$data_lineage <- base::list()
        columns <- base::list()
        for (str_col in base::names(dtf)){
          columns[[str_col]] <- base::list(
            base::list(
              from_dfi_id = "",
              from_columns = c(""),
              action = "",
              comment = ""
            )
          )
        }

        self$data_lineage[[base::as.character(self$id)]] <- base::list(
          name = self$name,
          columns = columns
        )
      } else {
        self$data_lineage <- data_lineage
      }

    }

  )
)
