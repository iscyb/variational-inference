library(rjson)
library(rstan)

#setwd("~/your/path/here")

X <- cbind(c(1,2), c(-1,-2), c(0,-1.8), c(3.9,3), c(-4,-1.2), c(2.1,-1.2))
X
train_dat <- list(X=t(X), N=dim(X)[2])
fit1 <- stan(file = "models/twodim.stan", data=train_dat, chains=2, iter=4000)
fit1

