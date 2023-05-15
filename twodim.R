library(rjson)
library(rstan)

setwd("~/Work/isac-vi")

X <- cbind(c(1,2), c(-1,-2), c(0,-1.8), c(3.9,3), c(-4,-1.2), c(2.1,-1.2))
X
train_dat <- list(X=t(X), N=dim(X)[2])
fit1 <- stan(file = "models/twodim.stan", data=train_dat, chains=2, iter=4000)
fit1

# Bernoulli regression
data <- fromJSON(file = "data_bernoulli.json")
train_data <- list(x=data$x, y=data$y, N=length(data$x))
train_data
fit1 <- stan(file = "models/bernoulli.stan", data=train_data, chains=4, iter=8000)
fit1
