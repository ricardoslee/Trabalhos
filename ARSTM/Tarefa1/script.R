install.packages("rgl")
install.packages("sna")
install.packages("network")
install.packages("igraph")

library(network)
library(sna)
library(rgl)
library(readxl)
library(igraph)

# Trabalha a partir de uma rede aleat?ria
rede <- read.table("Rede One Mode_Tarefa Aula 1_Paulista T4.csv",header=TRUE,sep = ",")

dim(rede)

# Adaptando o data.frame rede para que possa servir para a montagem da rede
grede <- rede[,2:17]
rownames(grede) <- rede[,1]
dim(grede)

# Construindo a rede a partir da matriz de rela??es (0 e 1)
gplot(grede)
gplot(grede,gmode="graph",displaylabels = TRUE)
gplot(grede,gmode="graph",displaylabels = TRUE,edge.col="gray",usearrows=F)
gplot(grede,gmode="graph",displaylabels = TRUE, edge.col="gray",usearrows=F,vertex.cex=degree(grede,gmode="graph",cmode="indegree")/3)
gplot(grede,gmode="graph",displaylabels = TRUE, edge.col="gray",usearrows=F,label=degree(grede,gmode="graph",cmode="indegree"))
gplot(grede,gmode="grede",displaylabels = TRUE, edge.col="gray",usearrows=F,vertex.cex=closeness(grede,gmode="graph")*2)
gplot(grede,gmode="grede",displaylabels = TRUE, edge.col="gray",usearrows=F,label=round(closeness(grede,gmode="graph"),digits=2))
gplot(grede,gmode="grede",displaylabels = TRUE, edge.col="gray",usearrows=F,vertex.cex=betweenness(grede,gmode="graph")/3+1)
gplot(grede,gmode="grede",displaylabels = TRUE, edge.col="gray",usearrows=F,label=betweenness(grede,gmode="graph"))


# Explorando a rede
sna::degree(grede,gmode="graph",cmode="indegree")
sna::closeness(grede,gmode="graph")
sna::betweenness(grede,gmode="graph")
sna::bicomponent.dist(grede) # retorna os bicomponentes de um gráfico de entrada, juntamente com a distribuição de tamanho e as informações de associação.
sna::bicomponent.dist(grede, symmetrize = c("strong", "weak"))
sna::components(grede,connected="weak")
sna::components(grede,connected="strong")
sna::cug.test(grede,gtrans,cmode="size") 
sna::cug.test(grede,gtrans,cmode="edges") 
sna::cug.test(grede,gtrans,cmode="dyad.census")
sna::diag.remove(grede)
sna::efficiency(grede)
sna::gden(grede)



# plot cluster
eq <- equiv.clust(grede)
plot(eq)

gplot(diag.remove(grede))

#  identiﬁes the cutpoints of an input graph. Depending on mode, either a directed or undirected notion of “cutpoint” can be used.
weak <- cutpoints(grede,connected="weak",return.indicator=TRUE)
gplot(grede,vertex.col=2+weak) 

strong <- cutpoints(grede,connected="strong",return.indicator=TRUE)
gplot(grede,vertex.col=2+strong) 

# Given a set of equivalence classes and one or more graphs, blockmodel will form a blockmodel of the input 
# graph(s) based on the classes in question, using the speciﬁed block content type.

eq<-equiv.clust(grede)
b<-blockmodel(grede,eq, h=2)
plot(b)



# Grand finale... para impressionar
gplot3d(grede)
gplot(grede, interactive = T)

######################### SNA

# Find the Central Graph of a Labeled Graph Stack
cg <- centralgraph(grede)
gplot3d(cg)

# Compute The Closeness Centrality Scores Of Network Positions
closeness(grede)

# Find weak components
components(grede,connected="weak")

# Find strong components
components(grede,connected="strong")

# Compute Graph Efficiency Scores
efficiency(grede, g=NULL, diag=FALSE)

# Compute The Degree Centrality Scores Of Network Positions
degree(grede, g=1, nodes=NULL, gmode="digraph", diag=FALSE, tmaxdev=FALSE, cmode="freeman", rescale=FALSE, ignore.eval=FALSE)

# Find The Density Of A Graph
gden(grede)

# gera a um objeto graph
g1 <- graph.adjacency(as.matrix(grede), weighted=NULL, mode = "directed")
summary(g1)

# mostra se o grafo tem coneccoes fortes ou fracas
is_connected(g1, mode = "weak")
count_components(g1, mode = "weak")

is_connected(g1, mode = "strong")
count_components(g1, mode = "strong")

######################### igraph
layout1 <- layout.fruchterman.reingold(g1)
layout2 <- layout.circle(g1)
layout3 <- layout.sphere(g1)
layout4 <- layout.random(g1)
layout5 <- layout.reingold.tilford(g1)
layout6 <- layout.kamada.kawai(g1)
layout7 <- layout.lgl(g1)


# plot a gragh using the parameters in the layout
plot(g1, layout=layout1)
plot(g1, layout=layout2)
plot(g1, layout=layout3)
plot(g1, layout=layout4)
plot(g1, layout=layout5)
plot(g1, layout=layout6)
plot(g1, layout=layout7)
