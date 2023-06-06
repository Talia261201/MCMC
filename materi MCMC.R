# }
#NOT RUN {
## default improper uniform prior
library(MCMCpack)
data(birthwt)
posterior <- MCMClogit(low~age+as.factor(race)+smoke, data=birthwt)
plot(posterior)
summary(posterior)

##multivariate normal prior
data(birthwt)
posterior <- MCMClogit(low~age+as.factor(race)+smoke, b0=0, B0=.001,
                       data=birthwt)
plot(posterior)
summary(posterior)

## user-defined independent cauchy
logpriorfun <- function(beta){
  sum(dcauchy(beta, log=TRUE))
}

posterior<- MCMClogit(low~age+as.factor(race)+smoke,
                      data=birthwt, user.prior.density=logpriorfun,
                      logfun=TRUE)
plot(posterior)
summary(posterior)

library(BayesARIMAX)
set.seed(121)
Y<- arima.sim(list(order = c(1,1,1),ar=0.7,ma=0.4), n = 49)
X=rnorm(50,4,1)
BayesARIMAX(Y,X)


## user-defined independent cauchy with additional args
