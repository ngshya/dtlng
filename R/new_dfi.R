#' @export

newDfi <- function(new_dataframe,
                   new_id = dtlng::getDfiId(),
                   new_name = "",
                   new_lng){

  new_dfi <- dfi$new(dataframe = new_dataframe,
                     id = new_id,
                     name = new_name,
                     lng = new_lng)

  base::return(new_dfi)
}
