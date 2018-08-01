# simular os dados
#?rnorm
x1<-rnorm(100)
x2<-.3*x1+rnorm(100)*.2
x3<-.9*x1+rnorm(100)*.9
x4<-rnorm(100)
x<-as.data.frame(cbind(x1,x2,x3,x4))

## ============================== QUESTAO 1 ====================================
#Questao 1
#Questao 1.a Altere o programa para que x4 tenha desvio padrao 100...
x4<-rnorm(100,sd=100);sd(x4)
#... e gere novamente o data frame w como a combinacao dos objetos x1, x2, x3 e o objeto x4 modificado;
w<-as.data.frame(cbind(x1,x2,x3,x4))

#--------------------------------------------------------------------------------
#Questao 1.b Calcule as matrizes de correlação para os objetos x e w, ao compará-las, o que você conclui?
#?corrplot
#install.packages("corrplot")
library(corrplot)
head(x)
head(w)
df<-data.frame(x,w)
head(df)
plot(df)
df.cor<-cor(df)


## ============================== QUESTAO 2 ====================================

#Questao 2
#Questao 2.a Carregue a imagem em ".ppm" e carregue-a no R. Considere a matriz da cor verde;
#install.packages("pixmap")
library(pixmap)
image <- read.pnm("IMAGEM.ppm")
image
#red.matrix <- matrix(image@red, nrow = image@size[1], ncol = image@size[2])
green.matrix <- matrix(image@green, nrow = image@size[1], ncol = image@size[2])
#blue.matrix <- matrix(image@blue, nrow = image@size[1], ncol = image@size[2])

#--------------------------------------------------------------------------------

#Questao 2.b Exiba a imagem correspondente à matriz da cor verde da imagem escolhida;
image(green.matrix, col = heat.colors(255))

#Questao 2.c Crie um objeto com a análise SVD dessa matriz. Analisando a matriz D, 
# quantas variáveis são necessárias para expressar a figura escolhida com pelo menos 
# 80% da informação?
green.matrix.svd <- svd(green.matrix)

names(green.matrix.svd)

d <- green.matrix.svd$d
u <- green.matrix.svd$u
v <- green.matrix.svd$v

dim(d)
dim(u)
dim(v)

# reconstruir a imagem
green.matrix.reconstruction <- u %*% diag(d) %*% t(v)
image(green.matrix.reconstruction)
#checar se a reconstrução foi bem sucedida
mean(green.matrix - green.matrix.reconstruction)

# avaliar a quantidade de informação por vetor singular (componente principal)
par(mar=c(4,4,0.5,0.5))

plot(d/sum(d), xlab = "Numero de componentes",
     ylab = "Proporcao da variancia explicada",
     type = "b")
plot(cumsum(d)/sum(d), xlab = "Numero de componentes",
     ylab = "Percentual da Variancia explicada",
     type = "b")

#--------------------------------------------------------------------------------

#Resposta 2.c: entre 50 e 60 componentes

#--------------------------------------------------------------------------------
  
#questao 2.d - preparacao
# Reconstruir a imagem apenas com um vetor
i = 1
green.matrix.compressed = as.matrix(u[,1]) %*% d[1:i] %*% as.matrix(t(v[,1]))
par(mar=c(0.5,0.5,0.5,0.5))
image(green.matrix.compressed, col = heat.colors(255))


#Reconstruir a imagem com "i" componentes
i<-30
green.matrix.compressed <- u[,1:i] %*% diag(d[1:i]) %*% t(v[,1:i])
par(mar=c(0.5,0.5,0.5,0.5))
image(green.matrix.compressed, col = heat.colors(255))


#Questao 2.d Faça imagens utilizando 1 variável do SVD, 5 e 10. 
#Faça mais 3 a 5 imagens tentando identificar o menor número de variáveis 
#que exiba a imagem com uma qualidade que você julgue adequada. 

i<-30
green.matrix.compressed <- u[,5] %*% d[1:i] %*% v[,10]
par(mar=c(0.5,0.5,0.5,0.5))
image(green.matrix.compressed, col = heat.colors(255))

i<-15
green.matrix.compressed <- as.matrix(5) %*% d[1:i] %*% as.matrix(t(10))
par(mar=c(0.5,0.5,0.5,0.5))
image(green.matrix.compressed, col = heat.colors(255))

i<-5
green.matrix.compressed <- as.matrix(5) %*% d[1:i] %*% as.matrix(t(10))
par(mar=c(0.5,0.5,0.5,0.5))
image(green.matrix.compressed, col = heat.colors(255))

#--------------------------------------------------------------------------------

#Questao 2.e.	Quantas variáveis você acredita serem adequadas para exprimir a imagem?
i<-50
green.matrix.compressed <- u[,1:i] %*% diag(d[1:i]) %*% t(v[,1:i])
par(mar=c(0.5,0.5,0.5,0.5))
image(green.matrix.compressed, col = heat.colors(255))


## ============================== QUESTAO 3 ====================================

#Questao 3
load("hbat.Rdata")
hbat
xhbat <-cor(hbat[,8:20])
#Etapa 3 - Geracao de fatores (a): Avaliando a medida de adequação da amostra (MSA) 
#das variaveis explicativas (X6 a X19), considerando o limite de 50% para o indice geral e por variavel,
library(corrplot)

par(mar=c(4,4,4,4))
corrplot(xhbat, type = "upper", order = "original", tl.col = "black", tl.srt = 45)
corrplot(xhbat, type = "upper", order = "hclust", tl.col = "black", tl.srt = 45)

plot(x)

#criar o objeto o PCA
pca1<-princomp(x,cor=FALSE)
names(pca1)
head(pca1$scores)
scores<-as.data.frame(pca1$scores)
plot(scores)

pca1$loadings
#verificar a soma dos desvios padrao
sd(x1)+sd(x2)+sd(x3)+sd(x4)
#verificar a soma das variancias das componentes
sum(pca1$sdev)
sd(x1)^2+sd(x2)^2+sd(x3)^2+sd(x4)^2
sum(pca1$sdev^2)

#criar o PCA usando a matriz de correlacoes
pca2<-princomp(x,cor=TRUE)
#verifiar a soma dos desvios padrao
sum(pca2$sdev^2)

#verificar medias e desvios padrao das variaveis orriginais
mean(x1)
sd(x1)
#verificar medias e desvios das variaveis padronizadas
mean(scale(x1))
sd(scale(x1))

#comparar as componentes principais com e sem matriz de correlacoes
summary(pca1)
summary(pca2)

#verificar componentes principais com matriz de covariancias e variaveis padronizadas
xpad<-as.data.frame(cbind(scale(x1),scale(x2),scale(x3),scale(x4)))
pca3<-princomp(xpad,cor=FALSE)
summary(pca3)
pca3$sdev
sum(pca3$sdev^2 )

x1_<-(x1-mean(x1))/sd(x1)
mean(x1_)
sd(x1_)

## ============================== QUESTAO 4 ====================================

library("dplyr")
library("psych")
library("foreign")  


#install.packages("corrplot")
library("corrplot")

getwd()
path<-"hbat.Rdata"
load(path)

head(hbat)


row.names(PCA)<-PCA$id
select1<-select(hbat,num_range("x",6:18))

select1
class(cor)

cor<-cor(select1)
corrplot(cor, type = "upper", order = "hclust", tl.col = "black", tl.srt = 45)

df<-as.data.frame(select1)
PCA<-princomp(df)
PCA
names(PCA)
PCA$sdev
PCA$sdev/sum(PCA$sdev)
plot(PCA,type='lines')


## ============================== QUEST?O 5 ====================================


# a)
EFA<-principal(df,nfactors=2,rotate="varimax")
names(EFA)
EFA$loadings

#--------------------------------------------------------------------------------
# b)
PCA$sdev
round(PCA$sdev^2,2)

#--------------------------------------------------------------------------------
# C)
summary(PCA)


## ============================== QUEST?O 6 ====================================


# a)
EFApromax<-principal(df,nfactors=2,rotate="promax")

EFApromax

names(EFApromax)
EFApromax$loadings
EFApromax$weights
EFApromax$scores
EFApromax$R2

# b)
EFApromax

EFAvarimax<-principal(df,nfactors=2,rotate="varimax")
EFAvarimax
