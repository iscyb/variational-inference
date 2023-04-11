data {
  int N;
  matrix[N,2] X;
}

parameters {
  vector[2] mu;
  real<lower=0.0> var1;
  real<lower=0.0> var2;
  real<lower=0.0> cov;
}

transformed parameters {
  matrix[2,2] Sigma = [[var1, cov], [cov, var2]];
}

model {
  // Add priors for better convergence
  var1 ~ exponential(3);
  var2 ~ exponential(3);
  cov ~ exponential(1);
  
  for (i in 1:N) {
    X[i] ~ multi_normal(mu, Sigma);
  }
  
}