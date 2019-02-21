context("test-train_test_acc_time")


# SAMPLE DATA

# models <- list('lm','rf','knn','svmLinearWeights')
# X_train <- data.frame(col1=sample(1:100,100, replace = TRUE ), 
#                       col2= sample(50:150,100, replace = TRUE ),
#                       col2= sample(500:750,100, replace = TRUE ))
# X_test <- data.frame(col1=sample(1:100,50, replace = TRUE ), col2= sample(50:150,50, replace = TRUE ))
# y_train <- runif(4,50,100)
# y_test <- runif(5,10,50)
# result <- data.frame(model = c('lm','rf','knn','svmLinearWeights'), 
#                       train_accuracy = runif(4,50,100),
#                       test_accuracy = runif(4,50,100),
#                       variance = runif(4,0,50),
#                       fit_time = runif(4,1,6),
#                       predict_time = runif(4,1,6),
#                       total_time = runif(4,2,12)
# )

library(ISLR)
library(caret)
library(LogicReg)
library(kernlab)

index <- createDataPartition(iris$Species,p = 0.75,list=FALSE)
(train_iris <- iris[index,])
(test_iris <- iris[-index,])
X_train <-train_iris[,names(iris)!='Species'] 
y_train <- train_iris[,names(iris)=='Species'] 
X_test <- test_iris[,names(iris)!='Species'] 
y_test <- test_iris[,names(iris)=='Species'] 

models <- c('svmPoly','knn','rf')

length(y_train)

# Sufficient inputs for the function tests

test_that("insufficient inputs for the function", {
  expect_error(train_test_acc_time(X_train, y_train, X_test, y_test))
  expect_error(train_test_acc_time(models,  y_train, X_test,y_test))
})


# Output should be 1 dataframe of 6 columns 
test_that("Output is 1 dataframe", {
  res <- train_test_acc_time(models, X_train, y_train, X_test, y_test)
  expect_equal(length(res), 6)
})

# The inupt should be correct format
test_that("whether input models is a list ", {
  expect_error(train_test_acc_time('models', X_train, y_train, X_test, y_test))
  expect_error(train_test_acc_time(models, 123, y_train, X_test, y_test))
               
})

# Dimensions for Xtrain and ytrain should be consistent 
test_that("consistency of Xtrain and ytrain domensions", {
  expect_equal(dim(X_train)[1],length(y_train))
               
  
})
  
  