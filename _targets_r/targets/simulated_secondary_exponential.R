tar_target(
  simulated_secondary_exponential, 
  simulated_cases_exponential |>
    simulate_secondary(
      meanlog = distributions[, "meanlog"][[1]],
      sdlog = distributions[, "sdlog"][[1]]
    ) |>
    DT(, distribution := distributions[, "scenario"][[1]]),
  pattern = map(distributions)
)
