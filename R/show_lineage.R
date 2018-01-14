#' @title showLineage
#' @description Show the data lineage.
#'
#' @param dtf_tree A dataframe containing the lineage.
#' @param str_type "dfi" --> Show the lineage of dataframes;
#' "columns" --> show the lineage of columns.
#'
#' @return A plot containing the lineage.
#'
#' @importFrom DiagrammeR create_node_df create_edge_df create_graph render_graph
#'
#' @export

showLineage <- function(dtf_tree, str_type = "dataframes"){

  if(str_type == "dataframes"){

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

  }

}
