source("utilFuns.R")


 g = getFunctionNetwork("ggvis")

 library(graph)
 library(igraph)

 gr = graphNEL(names(g), g, "directed")

 igr = igraph.from.graphNEL(gr)
 plot(igr)

 plot(igr, vertex.size = .75, edge.arrow.size = .2)
     # vertex.label = NA
     # See layout and igraph.plotting for more information.
     # http://igraph.org/r/doc/layout.html


    # Let's pare the graph down to remove some of the isolated nodes.
    # There are functions that are not called by anyother functions.

 notCalled = setdiff(names(g), unlist(g))
     # Still have isolated nodes, e.g. add_data.
     # This is not exported and so not in the names of g.
     # But ggvis which is the only function that calls it  gets excluded since no function calls it. 
 notCalled = setdiff(notCalled, c("ggvis", "mark", grep("^(layer_|knit_print)", names(g), value = TRUE)))
 cg = g[ - match(notCalled, names(g))]
 cgr = graphNEL(names(cg), cg, "directed")


 icgr = igraph.from.graphNEL(cgr)
 pos = plot(icgr, vertex.size = .75, edge.arrow.size = .4, layout = layout.kamada.kawai, vertex.label.dist = .25)

 
 # Perhaps display the not-called functions on the sides of the plot.
 # can use par()$usr to get coordinates.

 # Exercise: How do we igraph to plot these for us?

 # Rgraphviz

