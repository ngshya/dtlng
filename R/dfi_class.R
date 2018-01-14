#' @export

dfi <- R6::R6Class(

  "dfi",

  public = base::list(

    dataframe = NULL,
    id = NULL,
    name = NULL,

    initialize = function(dataframe = dplyr::data.frame(),
                          id = dtlng::getDfiId(),
                          name = "",
                          lng){

      self$dataframe <- dataframe
      self$id <- id
      self$name <- name

      if(!base::exists("dtlng_env", envir = base::globalenv())){
        base::assign("dtlng_env", base::new.env(parent = base::globalenv()), envir = base::globalenv())
      }

      if(!base::exists("tree", envir = base::globalenv()$dtlng_env)){
        base::assign("tree", base::new.env(parent = base::globalenv()$dtlng_env), envir = base::globalenv()$dtlng_env)
      }

      if(missing(lng)){

        lng <- base::data.frame(
          ID = id,
          NAME = name,
          COLUMNS = base::names(dataframe),
          FROM_ID = "",
          FROM_COLUMNS = "",
          ACTION = "NEW",
          COMMENT = "",
          stringsAsFactors = FALSE
        )

      }



      base::assign(
        x = paste0("dfi_", self$id),
        value = lng,
        envir = base::globalenv()$dtlng_env$tree
      )



    }

  )
)
