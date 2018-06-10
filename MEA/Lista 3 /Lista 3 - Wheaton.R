library(sem)
#data("Klein")
#Klein
#Klein$P.lag <- c(NA, Klein$P[-22])
#Klein$X.lag <- c(NA, Klein$X[-22])
#Klein[1:3,]
#Klein.eqn1 <- tsls(C ~ P + P.lag + I(Wp + Wg), instruments=~G + T + Wg + I(Year - 1931) + K.lag + P.lag + X.lag, data=Klein)
#Klein.eqn2 <- tsls(I ~ P + P.lag + K.lag, instruments=~G + T + Wg + I(Year - 1931) + K.lag + P.lag + X.lag, data=Klein)
#Klein.eqn3 <- tsls(Wp ~ X + X.lag + I(Year - 1931), instruments=~G + T + Wg + I(Year - 1931) + K.lag + P.lag + X.lag, data=Klein)

#summary(Klein.eqn1)
#summary(Klein.eqn2)
#summary(Klein.eqn3)

#sqrt(diag(vcov(Klein.eqn1)*17/21))

path.param.wheaton<-"./parametros_Wheaton.R"
mod.wh.1 <- specifyModel(path.param.wheaton)

S.wh <- matrix(c(
      11.834,     0,        0,        0,       0,        0,
       6.947,    9.364,     0,        0,       0,        0,
       6.819,    5.091,   12.532,     0,       0,        0,
       4.783,    5.028,    7.495,    9.986,    0,        0,
      -3.839,   -3.889,   -3.841,   -3.625,   9.610,     0,
     -21.899,  -18.831,  -21.748,  -18.775,  35.522,  450.288),
   6, 6, byrow=TRUE)

rownames(S.wh) <- colnames(S.wh) <-
  c('Anomia67','Powerless67','Anomia71','Powerless71','Education','SEI')

sem.wh.1 <- sem(mod.wh.1, S.wh, N=932)
summary(sem.wh.1)

standardizedCoefficients(sem.wh.1)

modIndices(sem.wh.1)

path.param.wheaton2<-"./parametros_Wheaton2.R"
mod.wh.2 <- specifyModel(path.param.wheaton2)

sem.wh.2 <- sem(mod.wh.2, S.wh, 932)
summary(sem.wh.2)

#install.packages("polycor")
library(polycor)
hetcor(S.wh, ML=TRUE)
hcor <- function(data) hetcor(data, std.err=FALSE)$correlations
R.wh <- hcor(S.wh)
R.wh
summary(R.wh)

