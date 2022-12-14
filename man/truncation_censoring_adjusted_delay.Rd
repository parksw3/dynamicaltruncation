% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/models.R
\name{truncation_censoring_adjusted_delay}
\alias{truncation_censoring_adjusted_delay}
\title{Estimate delays adjusted for censoring and right truncation}
\usage{
truncation_censoring_adjusted_delay(
  formula = brms::bf(delay_lwr | cens(censored, delay_upr) + trunc(lb = 0.001, ub =
    censored_obs_time) ~ 1, sigma ~ 1),
  data,
  fn = brms::brm,
  family = "lognormal",
  ...
)
}
\description{
Estimate delays adjusted for censoring and right truncation
}
