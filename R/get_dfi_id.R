#' @export

getDfiId <- function(){

  if(!base::exists("dtlng_env", envir = base::globalenv())){
    base::assign("dtlng_env", new.env(parent = base::globalenv()), envir = base::globalenv())
  }

  if(base::exists("dfi_last_id", envir = base::globalenv()$dtlng_env)){
    int_id <- base::get(x = "dfi_last_id", envir = base::globalenv()$dtlng_env)
    int_id <- int_id + 1
  } else {
    int_id <- 0
  }


  base::assign(x = "dfi_last_id", value = int_id, envir = base::globalenv()$dtlng_env)
  base::return(base::as.character(int_id))
}
