## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

## ------------------------------------------------------------------------
dtf01 <- data.frame(
  ID = base::seq(1, 100),
  NAME = base::sample(x = c("John", "Steven", "Helena", "Adele", "JJ", "Amy"),
                      size = 100,
                      replace = TRUE),
  AGE = base::as.integer(stats::runif(n = 100, min = 21, max = 30)),
  RANDOM = stats::runif(n = 100, min = 0, max = 1),
  stringsAsFactors = FALSE
)

dtf02 <- data.frame(
  ID = base::seq(1, 100),
  CITY = base::sample(x = c("Turin", "New York", "Milan", "Shanghai", "Paris", "Boston"),
                      size = 100,
                      replace = TRUE),
  stringsAsFactors = FALSE
)

## ------------------------------------------------------------------------
knitr::kable(utils::head(dtf01))
knitr::kable(utils::head(dtf02))

## ------------------------------------------------------------------------
library(dtlng)
dfi01 <- asDfi(dtf01, str_name = "dfi01")
dfi02 <- asDfi(dtf02, str_name = "dfi02")

## ------------------------------------------------------------------------
dfi03 <- dfi01 %>%
  select_("-RANDOM") %>%
  filter_(~(ID > 50)) %>%
  name("dfi03")

dfi04 <- dfi02 %>%
  filter_(~(ID > 20)) %>%
  name("dfi04")

dfi05 <- dfi03 %>%
  inner_join(dfi04, by = c("ID" = "ID")) %>%
  filter_(~(ID <= 90)) %>%
  name("dfi05")

## ------------------------------------------------------------------------
dtf_tree <- treeDtf()
knitr::kable(utils::head(dtf_tree))

## ------------------------------------------------------------------------
showLineage(dtf_tree = dtf_tree, str_type = "dataframes")

## ------------------------------------------------------------------------
showLineage(dtf_tree = dtf_tree, str_type = "columns")

