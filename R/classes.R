dfi <- R6::R6Class(

  "dfi",

  public = list(

    dataframe = NULL,
    dfi_name = NULL,
    dfi_id = NULL,
    data_lineage = NULL,

    initialize = function(dtf = dplyr::data.frame(), dfi_name = "", data_lineage, dfi_id = self$getDfiId()){

      self$dataframe <- dtf
      self$dfi_id <- dfi_id

      self$dfi_name <- dfi_name


      if(base::missing(data_lineage)){
        self$data_lineage <- list()
        lst_columns <- list()
        for (str_col in base::names(dtf)){
          lst_columns[[str_col]] <- list(list(from_dfi = "",
                                              from_columns = c(""),
                                              action = ""))
        }

        self$data_lineage[[as.character(self$dfi_id)]] <- list(
          name = self$dfi_name,
          columns = lst_columns
        )
      } else {
        self$data_lineage <- data_lineage
      }

    },

    # Select method.
    select_ = function(...){

      dataframe <- dplyr::select_(self$dataframe, ...)

      data_lineage <- self$data_lineage
      lst_columns <- list()
      for (str_col in base::names(dataframe)){
        lst_columns[[str_col]] <- list(list(from_dfi = self$dfi_id,
                                            from_columns = c(str_col),
                                            action = "SELECT"))
      }

      return(
        self$dlLog(
          dataframe = dataframe,
          lst_columns = lst_columns,
          data_lineage = data_lineage)
      )
    },

    View = function(){
      View(self$dataframe)
    },

    ncol = function(){
      return(dplyr::ncol(self$dataframe))
    },

    getDfiId = function(){
      if(base::exists("dfi_last_id", envir = base::globalenv())){
        int_id <- base::get(x = "dfi_last_id", envir = base::globalenv())
        int_id <- int_id + 1
      } else {
        int_id <- 0
      }
      base::assign(x = "dfi_last_id", value = int_id, envir = base::globalenv())
      return(int_id)
    },

    dlLog = function(new_dfi_id = self$getDfiId(),
                     dataframe,
                     lst_columns,
                     data_lineage){

      new_dfi_id <- self$getDfiId()

      data_lineage[[as.character(new_dfi_id)]] <- list(
        name = "",
        columns = lst_columns
      )

      dfi_out <- dfi$new(dtf = dataframe,
                         data_lineage = data_lineage,
                         dfi_id = new_dfi_id)
      return(dfi_out)
    }


  )
)
