library(dtlng)

dtf <- data.frame(A = c(1,2,3), B = c(2,3,4), C = c(3,4,5))
dfi1 <- asDfi(dtf) %>% name("dfi1")
dfi2 <- dfi1 %>% select_("A", "C") %>% name("dataframe 2")
dfi3 <- dfi1 %>% select_("A", "C") %>% select_("C") %>% name("dataframe improved 3")
dfi4 <- dfi2 %>% select_("C") %>% name("dfi4")
dfi5 <- asDfi(data.frame(AAA = c(1,2,3), Z = c(1,2,3))) %>% name("dfi5")
dfi6 <- dfi1 %>% full_join(dfi5, by = c("A" = "AAA")) %>% name("dfi6")
dfi7 <- dfi6 %>% select_("B", "C", "Z") %>% full_join(dfi2, by = c("C")) %>% name("dfi7")



lst_tree <- base::as.list(base::get("tree", envir = base::globalenv()$dtlng_env))
dtf_tree <- base::do.call(rbind, lst_tree)



library(DiagrammeR)
library(purrr)


dtf_edges <- base::unique(dtf_tree[, c("ID", "NAME", "FROM_ID", "ACTION")])
dtf_nodes <- base::unique(dtf_tree[, c("ID", "NAME")])

str_nodes <- base::sort(base::unique(c("", dtf_edges$ID)))
str_nodes_names <- unlist(sapply(X = str_nodes,
                                 FUN = function(x){
                                   dtf_nodes$NAME[which(dtf_nodes$ID == x)]
                                   }))
str_nodes_names <- c("DATA", str_nodes_names)

int_from <- unlist(sapply(X = dtf_edges$FROM_ID,
                          FUN = function(x){which(str_nodes == x)}))
int_to <- unlist(sapply(X = dtf_edges$ID,
                        FUN = function(x){which(str_nodes == x)}))

nodes_df <-
  DiagrammeR::create_node_df(
    n = length(str_nodes),
    label = str_nodes_names,
    shape = rep("rectangle", length(str_nodes))#,
    #width = 1
  )

edges_df <-
  DiagrammeR::create_edge_df(
    from = int_from,
    to = int_to,
    label = dtf_edges$ACTION,
    color = "black",
    fontsize = 4
  )

graph <-
  DiagrammeR::create_graph(
    nodes_df = nodes_df,
    edges_df = edges_df
  )

DiagrammeR::render_graph(graph, layout = "tree")

