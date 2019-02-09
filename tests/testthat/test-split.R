context("Spliting data into Train, Test, Validation, TrainValidation")

test_that("Inputs X and y are dataframes", {
  expect_error(split("X", y, 0.6, 0.2, 0.2), "X is not a dataframe")
  expect_error(split(as.data.frame(X), "y", 0.6, 0.2, 0.2), "y is not a dataframe")
})

test_that("Input proportions should be a non-negative floats", {
  expect_error(split(X, y, "60%", 0.2, 0.2), "input proportions should be non-negative floats")
  expect_error(split(X, y, 0.6, -0.2, 0.2), "input proportions should be non-negative floats")
  expect_error(split(X, y, 0.6, 0.2, -20), "input proportions should be non-negative floats")
})

test_that("Output sets have the same column dimensions as the given X and Y", {
  splits <- split(X, y, 0.6, 0.2, 0.2)
  expect_equal(ncol(splits[1]), ncol(X))
  expect_equal(ncol(splits[2]), ncol(y))
  expect_equal(ncol(splits[3]), ncol(X))
  expect_equal(ncol(splits[4]), ncol(y))
  expect_equal(ncol(splits[5]), ncol(X))
  expect_equal(ncol(splits[6]), ncol(y))
  expect_equal(ncol(splits[7]), ncol(X))
  expect_equal(ncol(splits[8]), ncol(y))
})

test_that("Output are of data.frame types", {
  splits <- split(X, y, 0.6, 0.2, 0.2)
  expect_equal(is.data.frame(splits[1]), TRUE)
  expect_equal(is.data.frame(splits[2]), TRUE)
  expect_equal(is.data.frame(splits[3]), TRUE)
  expect_equal(is.data.frame(splits[4]), TRUE)
  expect_equal(is.data.frame(splits[5]), TRUE)
  expect_equal(is.data.frame(splits[6]), TRUE)
  expect_equal(is.data.frame(splits[7]), TRUE)
  expect_equal(is.data.frame(splits[8]), TRUE)
})

test_that("Output is 8 dataframes", {
  splits <- split(X, y, 0.6, 0.2, 0.2)
  expect_equal(length(splits), 8)
})