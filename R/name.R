#' @title name
#' @description Assign a name to the dfi.
#'
#' @param x A dfi.
#' @param str_name The new name.
#'
#' @return The dfi in input with the name.
#'
#' @export

name = function(x, str_name){
  x$name <- str_name
  dtf_tmp <- base::get(x = paste0("dfi_", x$id),
                       envir = base::globalenv()$dtlng_env$tree)
  dtf_tmp$NAME <- str_name
  base::assign(x = paste0("dfi_", x$id),
               value = dtf_tmp,
               envir = base::globalenv()$dtlng_env$tree)

  return(x)

}
