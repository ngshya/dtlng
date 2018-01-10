dtlngLog <- function(lst_args, str_action, int_pf, str_cols){

  if(base::exists("data_lineage_log", envir = base::globalenv())){

    str_variables <- base::names(lst_args)
    str_values <- unlist(lst_args)
    str_4_log <- paste0(paste0(str_variables,
                               ifelse(str_variables == "", "", "="),
                               str_values)[c(-1, -2)],
                        collapse = ", ")
    str_cols <- base::ifelse(base::missing(str_cols), "", base::paste0(str_cols, collapse = "; "))

    base::assign("data_lineage_log",
                 base::rbind(base::get("data_lineage_log", envir = base::globalenv()),
                       c(utils::capture.output(base::parent.frame(n = int_pf+1)),
                        str_action,
                        str_4_log,
                        str_cols)),
                 envir = base::globalenv())

  }
}
