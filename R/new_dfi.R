#' @export

newDfi <- function(old_dfi,
                   new_dataframe,
                   new_name = "",
                   new_columns){

  new_data_lineage <- old_dfi$data_lineage
  new_id <- dtlng::getDfiId()
  new_data_lineage[[new_id]] <- base::list(
    name = new_name,
    columns = new_columns
  )

  new_dfi <- dfi$new(dataframe = new_dataframe,
                     id = new_id,
                     name = new_name,
                     data_lineage = new_data_lineage)

  base::return(new_dfi)
}
