% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/models.R
\name{filtered_censoring_adjusted_delay}
\alias{filtered_censoring_adjusted_delay}
\title{Estimate delays with filtering of the most recent data and
censoring adjustment}
\usage{
filtered_censoring_adjusted_delay(
  formula = brms::bf(delay_lwr | cens(censored, delay_upr) ~ 1, sigma ~ 1),
  data,
  fn = brms::brm,
  family = "lognormal",
  truncation = 10,
  ...
)
}
\description{
Estimate delays with filtering of the most recent data and
censoring adjustment
}
