library(dtlng)

dtf <- data.frame(A = c(1,2,3), B = c(2,3,4), C = c(3,4,5))
dfi1 <- asDfi(dtf) %>% name("dfi1")
dfi2 <- dfi1 %>% select_("A", "C") %>% name("dfi2")
dfi3 <- dfi1 %>% select_("A", "C") %>% select_("C") %>% name("dfi3")
dfi4 <- dfi2 %>% select_("C") %>% name("dfi4")
dfi5 <- asDfi(data.frame(AAA = c(1,2,3), Z = c(1,2,3))) %>% name("dfi5")
dfi6 <- dfi1 %>% full_join(dfi5, by = c("A" = "AAA")) %>% name("dfi6")
dfi7 <- dfi6 %>% select_("B", "C", "Z") %>% full_join(dfi2, by = c("C")) %>% name("dfi7")



dtf_tree <- treeDtf()

showLineage(dtf_tree = dtf_tree, str_type = "dataframes")
showLineage(dtf_tree = dtf_tree, str_type = "columns")

