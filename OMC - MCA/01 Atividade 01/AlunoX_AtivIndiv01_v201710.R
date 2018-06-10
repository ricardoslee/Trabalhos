# Limpando o console.
cat("\014") 
# Limpando o Global Environment.
rm(list = ls())


d = c(0,.1,.1,.2,.6,.15,0,.05,.35,.45,.2,.1,0,.13,.57,0,0,0,1,0,0,0,0,0,1)
M = matrix(data = d, nrow = 5, ncol = 5, byrow = TRUE)
#dimnames(M) <- list(c("site","hotpage","call center","venda","saida"),c("site","hotpage","call center","venda","saida"))
M

#install.packages("markovchain")
library(markovchain)

dtmc <- new("markovchain",transitionMatrix=M,
            states=c("site","hotpage","call center","venda","saida"),
            name="MarkovChain para o e-commerce") 
#dtmc

#plot(dtmc)

#a.1
initialState<-c(0,1,0,0,0)
steps<-1
finalState<-initialState*(dtmc^steps) #using power operator
round(finalState,digits = 3)

#a.2
initialState<-c(0,1,0,0,0)
steps<-2
finalState<-initialState*(dtmc^steps) #using power operator
round(finalState,digits = 3)

#Site
initialState<-c(1,0,0,0,0)
steps<-4
finalState<-initialState*(dtmc^steps) #using power operator
round(finalState,digits = 3)

#hotpage
initialState<-c(0,1,0,0,0)
steps<-5
finalState<-initialState*(dtmc^steps) #using power operator
round(finalState,digits = 3)

#call center
initialState<-c(0,0,1,0,0)
steps<-5
finalState<-initialState*(dtmc^steps) #using power operator
round(finalState,digits = 3)

# .50 Site .20 Hotpage .30% Call Center 
initialState<-c(.5,.2,.3,0,0)
steps<-5
finalState<-initialState*(dtmc^steps) #using power operator
round(finalState,digits = 3)

