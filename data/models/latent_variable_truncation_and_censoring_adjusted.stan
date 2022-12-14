// generated with brms 2.18.0
functions {
  real latent_lognormal_lpdf(vector y, vector mu, vector sigma,
                             vector pwindow, vector swindow,
                             array[] real obs_t) {
    int n = num_elements(y);
    vector[n] d = y - pwindow + swindow;
    vector[n] obs_time = to_vector(obs_t) - pwindow;
    return lognormal_lpdf(d | mu, sigma)
           - lognormal_lcdf(obs_time | mu, sigma);
  }
}
data {
  int<lower=1> N; // total number of observations
  vector[N] Y; // response variable
  // data for custom real vectors
  array[N] real vreal1;
  // data for custom real vectors
  array[N] real vreal2;
  // data for custom real vectors
  array[N] real vreal3;
  int prior_only; // should the likelihood be ignored?
  int wN;
  array[N - wN] int noverlap;
  array[wN] int woverlap;
}
transformed data {
  
}
parameters {
  real Intercept; // temporary intercept for centered predictors
  real Intercept_sigma; // temporary intercept for centered predictors
  
  vector<lower=0, upper=1>[N] swindow_raw;
  vector<lower=0, upper=1>[N] pwindow_raw;
}
transformed parameters {
  real lprior = 0; // prior contributions to the log posterior
  
  vector<lower=0>[N] pwindow;
  vector<lower=0>[N] swindow;
  swindow = to_vector(vreal3) .* swindow_raw;
  pwindow[noverlap] = to_vector(vreal2[noverlap]) .* pwindow_raw[noverlap];
  if (wN) {
    pwindow[woverlap] = swindow[woverlap] .* pwindow_raw[woverlap];
  }
  
  lprior += student_t_lpdf(Intercept | 3, 0, 2.5);
  lprior += student_t_lpdf(Intercept_sigma | 3, 0, 2.5);
}
model {
  swindow_raw ~ uniform(0, 1);
  pwindow_raw ~ uniform(0, 1);
  
  // likelihood including constants
  if (!prior_only) {
    // initialize linear predictor term
    vector[N] mu = rep_vector(0.0, N);
    // initialize linear predictor term
    vector[N] sigma = rep_vector(0.0, N);
    mu += Intercept;
    sigma += Intercept_sigma;
    sigma = exp(sigma);
    target += latent_lognormal_lpdf(Y | mu, sigma, pwindow, swindow, vreal1);
  }
  // priors including constants
  target += lprior;
}
generated quantities {
  // actual population-level intercept
  real b_Intercept = Intercept;
  // actual population-level intercept
  real b_sigma_Intercept = Intercept_sigma;
}

