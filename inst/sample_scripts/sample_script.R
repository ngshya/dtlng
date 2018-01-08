library(dplyr)
library(dtlng)

sampleF <- function(){

  dtf_data %<-% data.frame(A = c(1, 2, 3, 2),
                           B = c(4, 5, 6, 5),
                           C = c(10, 20, 30, 40))

  dtf_new %<-% dtlng::dl(dtf_data) %>%
    dtlng::select_("A", "B", "C") %>%
    dtlng::filter_(~(A > 0))

  x %<-% 1234

  dtf_brand_new %<-% dtlng::dl(dtf_new) %>%
    dtlng::select_("B", "A", "C") %>%
    dtlng::group_by_(~A, ~B) %>%
    dtlng::summarise_(D = ~sum(C)) %>%
    dtlng::mutate_(E = ~(A + B),
                   F = ~(A + B)) %>%
    dtlng::rename_(.dots = setNames("A", "NEW_A")) %>%
    dtlng::left_join(dtf_data, by = c("B" = "B", "NEW_A" = "A")) %>%
    dtlng::right_join(dtf_data, by = c("B" = "B")) %>%
    dtlng::inner_join(dtf_data, by = c("B" = "B")) %>%
    dtlng::full_join(dtf_data, by = c("B" = "B"))



  return(dtf_brand_new)

}


startDataLineage()




dtf_out %<-% sampleF()




dl(data.frame(A = c(1,2,3))) %>% select_("A")
