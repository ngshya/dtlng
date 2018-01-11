#' @export

getDfiId <- function(){
  if(base::exists("dfi_last_id", envir = base::globalenv())){
    int_id <- base::get(x = "dfi_last_id", envir = base::globalenv())
    int_id <- int_id + 1
  } else {
    int_id <- 0
  }
  base::assign(x = "dfi_last_id", value = int_id, envir = base::globalenv())
  base::return(base::as.character(int_id))
}
