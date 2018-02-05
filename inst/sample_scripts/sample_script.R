library(dtlng)

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


dfi01 <- asDfi(dtf01, str_name = "dfi01")
dfi02 <- asDfi(dtf02, str_name = "dfi02")


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

dfi06 <- dfi03 %>%
  left_join(dfi04, by = c("ID" = "ID")) %>%
  select_("ID", "AGE", "CITY") %>%
  name("dfi06")

dfi07 <- dfi03 %>%
  right_join(dfi04, by = c("ID" = "ID")) %>%
  name("dfi07")

dfi08 <- dfi03 %>%
  full_join(dfi04, by = c("ID" = "ID")) %>%
  filter_(~(ID > 90)) %>%
  select_("ID", "CITY") %>%
  name("dfi08")

dfi09 <- dfi01 %>%
  mutate_(NEW_COLUMN = ~( AGE + RANDOM ),
          NEW_COLUMN_2 =  ~( NEW_COLUMN / RANDOM )) %>%
  name("dfi09")

fi10 <- dfi09 %>%
  group_by_(~NAME, ~AGE) %>%
  summarise_(SUM_RANDOM = ~sum(RANDOM),
             SUM_NEW_COLUMN = ~sum(RANDOM)) %>%
  name("dfi10")

fi11 <- dfi01 %>%
  group_by_(~NAME, ~AGE) %>%
  summarise_(SUM_RANDOM = ~sum(AGE)) %>%
  spread_(key = "AGE", value = "SUM_RANDOM") %>%
  name("dfi11")

fi12 <- dfi01 %>%
  rename_(.dots = c("NEW_ID" = "ID",
                    "NEW_AGE" = "AGE")) %>%
  name("dfi12")


dtf_tree <- treeDtf()

showLineage(dtf_tree = dtf_tree, str_type = "dataframes")
showLineage(dtf_tree = dtf_tree, str_type = "columns")

