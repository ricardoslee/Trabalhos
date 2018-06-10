#Questao 3

hbat400<-read.csv(file="./hbat_clima.csv")
fit.min.hbat400<- glm(evasao~1,family = binomial(link = "logit"),data=hbat400)

stp.hbat400<-step(fit.min.hbat400,
                  direction="both",
                  scope=(~
                           JS1 + JS2 + JS3 + JS4 + JS5 + 
                           OC1 + OC2 + OC3 + OC4 + 
                           EP1 + EP2 + EP3 + EP4 + 
                           AC1 + AC2 + AC3 + AC4 + 
                           SI1 + SI2 + SI3 + SI4
                  ))
summary(stp.hbat400)

#Questao 4
summary(glm(evasao~SI1,family = binomial(link = "logit"),data=hbat400))
summary(glm(evasao~SI2,family = binomial(link = "logit"),data=hbat400))
summary(glm(evasao~SI3,family = binomial(link = "logit"),data=hbat400))
summary(glm(evasao~SI4,family = binomial(link = "logit"),data=hbat400))
cor(hbat400[,c(16,18,21)])

