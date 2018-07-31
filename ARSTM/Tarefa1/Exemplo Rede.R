## FGV-Management - 1S2018
## An?lise de Redes Sociais e Text Mining - Aula 1
## Prof. Eduardo de Rezende Francisco
## Data: 28/Julho/2018                             

## Exemplo de SNA - Social Network Analysis - Rede ONE MODE

# Extens?es para An?lise de Redes
#(devem ser previamente baixadas no CRAN do R)

#install.packages("network")
library(network)
#install.packages("sna")
library(sna)
#install.packages("rgl")
library(rgl)

# Trabalha a partir de uma rede aleat?ria
rede <- read.table("Exemplo Rede.csv",header=TRUE,sep = ";", dec=",")
rede

# Adaptando o data.frame rede para que possa servir para a montagem da rede
grede <- rede[,2:10]
rownames(grede) <- rede[,1]
grede

# Construindo a rede a partir da matriz de rela??es (0 e 1)
gplot(grede)
gplot(grede,gmode="graph",displaylabels = TRUE)
gplot(grede,gmode="graph",displaylabels = TRUE,edge.col="gray",usearrows=FALSE)

# Explorando a rede
degree(grede,gmode="graph",cmode="indegree")
closeness(grede,gmode="graph")
betweenness(grede,gmode="graph")

# Aprimorando a representa??o da rede
gplot(grede,gmode="grede",displaylabels = TRUE,
      edge.col="gray",usearrows=FALSE,vertex.cex=degree(grede,gmode="graph",cmode="indegree")/3)

gplot(grede,gmode="grede",displaylabels = TRUE,
      edge.col="gray",usearrows=FALSE,label=degree(grede,gmode="graph",cmode="indegree"))

gplot(grede,gmode="grede",displaylabels = TRUE,
      edge.col="gray",usearrows=FALSE,vertex.cex=closeness(grede,gmode="graph")*2)

gplot(grede,gmode="grede",displaylabels = TRUE,
      edge.col="gray",usearrows=FALSE,label=round(closeness(grede,gmode="graph"),digits=2))

gplot(grede,gmode="grede",displaylabels = TRUE,
      edge.col="gray",usearrows=FALSE,vertex.cex=betweenness(grede,gmode="graph")/3+1)

gplot(grede,gmode="grede",displaylabels = TRUE,
      edge.col="gray",usearrows=FALSE,label=betweenness(grede,gmode="graph"))

# Grand finale... para impressionar
gplot3d(grede)
# ^^^^^^^^^^ => precisa testar em casa

# Comando ?til para explorar redes
# Gera redes aleat?rias
grede2 <- rgraph(10)
grede2

# Interprete as m?tricas de centralidade de grau, proximidade e intermedia??o
# para a rede da vari?vel grede
