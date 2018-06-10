# Limpando o console.
cat("\014") 
# Limpando o Global Environment.
rm(list = ls())


d = c(.006,.089,.004,
      .028,.056,.012,
      .035,.04,.015,
      .014,.045,.017,
      .026,.029,.008,
      .032,.056,.018,
      .028,.03,.021,
      .01,.006,.03,
      .02,.034,.013,
      .026,.038,.017)

M = matrix(data = d, nrow = 10, ncol = 3, byrow = TRUE)
dimnames(M) <- list(c("1","2","3","4","5","6","7","8","9","10"),c("A","B","C"))
M

A.cart = .5
B.cart = .35
C.cart = .15

#Questao 1
#a)
A.mean = mean(M[,1])
A.mean
A.ret = A.cart * A.mean
A.ret
B.mean = mean(M[,2])
B.mean
B.ret = B.cart * B.mean
B.ret
C.mean = mean(M[,3])
C.mean
C.ret = C.cart * C.mean
C.ret

retorno = A.ret + B.ret + C.ret
retorno


#b) Variancia
A.var = var(M[,1])
A.var
B.var = var(M[,2])
B.var
C.var = var(M[,3])
C.var
#b) covariancia
M.cov = cov(M)
M.cov
# covariancias individuais
#A.cov.AA = cov(M[,1],M[,1])
#A.cov.AA
#A.cov.AB = cov(M[,1],M[,2])
#A.cov.AB
#A.cov.AC = cov(M[,1],M[,3])
#A.cov.AC
#A.cov.BA = cov(M[,2],M[,1])
#A.cov.BA
#A.cov.BB = cov(M[,2],M[,2])
#A.cov.BB
#A.cov.BC = cov(M[,2],M[,3])
#A.cov.BC
#A.cov.CA = cov(M[,3],M[,1])
#A.cov.CA
#A.cov.CB = cov(M[,3],M[,2])
#A.cov.CB
#A.cov.CC = cov(M[,3],M[,3])
#A.cov.CC

#c)
M.cart1 = matrix(c(A.cart,B.cart,C.cart), nrow = 1, byrow = TRUE)
M.cart1
M.cart2 = matrix(c(A.cart,B.cart,C.cart), nrow = 3, byrow = FALSE)
M.cart2
risco = sqrt(M.cart1 %*% M.cov %*% M.cart2)
risco

#A.sd = sd(M[,1])
#A.sd
#B.sd = sd(M[,2])
#B.sd
#C.sd = sd(M[,3])
#C.sd
#M.sd = sd(M)
#M.sd

