context("test-gravity.R")

test_that("Tetrads returns a valid output", {
  # Example for CRAN checks:
  # Executable in < 5 sec
  library(dplyr)
  data("gravity_no_zeros")

  # Choose 5 countries for testing
  countries_chosen <- c("AUS", "CHN", "GBR", "BRA", "CAN")
  grav_small <- filter(gravity_no_zeros, iso_o %in% countries_chosen)

  fit <- tetrads(
    dependent_variable = "flow",
    distance = "distw",
    additional_regressors = "rta",
    code_origin = "iso_o",
    code_destination = "iso_d",
    filter_origin = countries_chosen[1],
    filter_destination = countries_chosen[2],
    multiway = FALSE,
    data = grav_small
  )

  expect_is(fit, "lm")
})
