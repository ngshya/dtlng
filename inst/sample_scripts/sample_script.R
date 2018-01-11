library(dtlng)

dtf <- data.frame(A = c(1,2,3), B = c(2,3,4), C = c(3,4,5))
dfi1 <- asDfi(dtf)
dfi2 <- dfi1 %>% select_("A", "C")
dfi3 <- dfi1 %>% select_("A", "C") %>% select_("C")
dfi4 <- dfi2 %>% select_("C")
