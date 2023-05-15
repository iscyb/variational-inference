data {
  int N;
  real x[N];
  int<lower=0, upper=1> y[N];
}

parameters {
  real mu;
  real<lower=0.0> Sigma;
  real alpha;
  real beta;
}

model {

  for (i in 1:N) {
    x[i] ~ normal(mu, Sigma);
    y[i] ~ bernoulli_logit(alpha + x[i] * beta);
  }
  
}