context("test-train_test_acc_time")


# SAMPLE DATA

models <- list('lm','rf','knn','svmLinearWeights')
X_train <- data.frame(col1=sample(1:100,100, replace = TRUE ), 
                      col2= sample(50:150,100, replace = TRUE ),
                      col2= sample(500:750,100, replace = TRUE ))
X_test <- data.frame(col1=sample(1:100,50, replace = TRUE ), col2= sample(50:150,50, replace = TRUE ))
y_train <- runif(4,50,100)
y_test <- runif(5,10,50)
result <- data.frame(model = c('lm','rf','knn','svmLinearWeights'), 
                      train_accuracy = runif(4,50,100),
                      test_accuracy = runif(4,50,100),
                      variance = runif(4,0,50),
                      fit_time = runif(4,1,6),
                      predict_time = runif(4,1,6),
                      total_time = runif(4,2,12)
)

# Sufficient inputs for the function tests

test_that("insufficient inputs for the function", {
  expect_error(train_test_acc_time(X_train, y_train, X_test, y_test),
               "models list input is missing")
  expect_error(train_test_acc_time(models, X_train, y_train, X_test),
               "y-test dataframe is missing")
})

# Output should be 1 dataframe 
test_that("Output is 1 dataframe", {
  res <- train_test_acc_time(models, X_train, y_train, X_test, y_test)
  expect_equal(length(res), 1)
})

# Check the input type 
test_that("whether input models is a list ", {
  expect_error(train_test_acc_time('models', X_train, y_train, X_test, y_test),
               "The models should be list ")
  expect_error(train_test_acc_time(models, 'X_train', y_train, X_test, y_test),
               "The X train should be dataframe")
})

# Check models input is not empty
test_that("whether input models is not an empty list ", {
  expect_error(train_test_acc_time(models, X_train, y_train, X_test, y_test),
               "The models list should not be empty  ")

})

# Dimensions for Xtrain and ytrain should be consistent 
test_that("consistency of Xtrain and ytrain domensions", {
  expect_error(train_test_acc_time(models, X_train, y_train, X_test, y_test),
               "The dimensions of Xtrain and ytrain are not consistent   ")
  
})









