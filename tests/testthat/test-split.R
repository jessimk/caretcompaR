context("test-split")

#Sample Data
X <- iris[,1:4]
y <- iris$Species

#Tests
test_that("Input X and Input Y are the same length", {
  expect_error(split(X[1,], y, 0.6, 0.2, 0.2), "X and y are don't have the same amount of rows. X and y need to number of rows.")
})

test_that("Input X is a dataframes", {
  expect_error(split("X", y, 0.6, 0.2, 0.2), "X needs to be a data.frame class but it's currently a different class.")
})

test_that("Input y is a vector", {
  expect_error(split(X, as.data.frame(y), 0.6, 0.2, 0.2), "y needs to be a vector but it's currently a different class.")
})

test_that("Input proportions are numerics", {
  expect_error(split(X, y, "not a numeric", 0.2, 0.2), "Proportions must be numerics.")
  expect_error(split(X, y, 0.2,  list(1,2,3), 0.2), "Proportions must be numerics.")
  expect_error(split(X, y, 0.6, 0.2, NULL), "Proportions must be numerics.")
})

test_that("Input proportions should be non-negative, non-zero, floats that add to 1.", {
  expect_error(split(X, y, 60, 0.2, 0.2), "Input proportions should be non-negative, non-zero, floats that add to 1.")
  expect_error(split(X, y, 0.6, -0.2, 0.2), "Input proportions should be non-negative, non-zero, floats that add to 1.")
  expect_error(split(X, y, 0.6, 0.2, -20), "Input proportions should be non-negative, non-zero, floats that add to 1.")
  
  expect_error(split(X, y, 0.6, 0.22, 0.2), "Input proportions should be non-negative, non-zero, floats that add to 1.")
  expect_error(split(X, y, 0., 0.2, -20), "Input proportions should be non-negative, non-zero, floats that add to 1.")
  expect_error(split(X, y, 0.6, 0.2, 0), "Input proportions should be non-negative, non-zero, floats that add to 1.")
  })

test_that("Output sets have the same column dimensions as the given X and Y", {
  splits <- split(X, y, 0.6, 0.2, 0.2)
  expect_equal(dim(splits[[1]])[2], ncol(X))
  expect_equal(dim(splits[[2]])[2], 1)
  expect_equal(dim(splits[[3]])[2], ncol(X))
  expect_equal(dim(splits[[4]])[2], 1)
  expect_equal(dim(splits[[5]])[2], ncol(X))
  expect_equal(dim(splits[[6]])[2], 1)
  expect_equal(dim(splits[[7]])[2], ncol(X))
  expect_equal(dim(splits[[8]])[2], 1)
})

test_that("Output are of data.frame types", {
  splits <- split(X, y, 0.6, 0.2, 0.2)
  expect_equal(is.data.frame(splits[[1]]), TRUE)
  expect_equal(is.data.frame(splits[[2]]), TRUE)
  expect_equal(is.data.frame(splits[[3]]), TRUE)
  expect_equal(is.data.frame(splits[[4]]), TRUE)
  expect_equal(is.data.frame(splits[[5]]), TRUE)
  expect_equal(is.data.frame(splits[[6]]), TRUE)
  expect_equal(is.data.frame(splits[[7]]), TRUE)
  expect_equal(is.data.frame(splits[[8]]), TRUE)
})

test_that("Output is a list of 8 items", {
  splits <- split(X, y, 0.6, 0.2, 0.2)
  expect_equal(length(splits), 8)
  expect_equal(isTRUE(is.list(splits)), T)
})

test_that("Output proportions match given proportions", {
  
  total_rows <- length(y)
  sixty_percent <- 0.6
  twenty_percent <- 0.2
  splits <- split(X, y, sixty_percent, twenty_percent, twenty_percent)
  
  expect_equal(nrow(splits[[1]]) / total_rows, sixty_percent)
  expect_equal(nrow(splits[[2]]) / total_rows, sixty_percent)
  expect_equal(nrow(splits[[3]]) / total_rows, twenty_percent)
  expect_equal(nrow(splits[[4]]) / total_rows, twenty_percent)
  expect_equal(nrow(splits[[5]]) / total_rows, twenty_percent + sixty_percent)
  expect_equal(nrow(splits[[6]]) / total_rows, twenty_percent + sixty_percent)
  expect_equal(nrow(splits[[7]]) / total_rows, twenty_percent)
  expect_equal(nrow(splits[[8]]) / total_rows, twenty_percent)
})