#' Splitting data into train, validation, train_validation and test sets
#' 
#' This function splits the training set X, and target set y (class labels in classification, real numbers in regression) into train, validation, train & validation, and test sets according to specified proportions. 
#' Proportions must add up to 1.
#' 
#' Outputs four X dataframes and four y dataframes. 
#' One each for training, validation, test, and a combined training and validation set.
#' 
#' 
#' Resulting dataframes are sorted in a list in this order: 
#' 1. X_train , 
#' 2. y_train , 
#' 3. X_validation , 
#' 4. y_validation , 
#' 5. X_train_validation , 
#' 6. y_train_validation , 
#' 7. X_test , 
#' 8. y_test .
#' 
#'
#' @param X A dataframe of training data
#' @param y A vector of the target data
#' @param prop_train A non-negative, non-zero, float; proportion of data to be split into a training set. 
#' @param prop_validation A non-negative, non-zero,float; proportion of data to be split into a validation set.
#' @param prop_test A non-negative, non-zero, float; proportion of data to be split into a test set. 
#' @return A list of eight dataframes covering training, validation, test and train_validation sets.
#' @export 
#' 
#' @import caret
#' @import stats
#'
#' @examples
#' #Splitting data into 70% train, 10% validation, 20% test
#' eight_datasets <- split(iris[,1:4], iris$Species, 0.7, 0.1, 0.2)
#' #X_train training set can be accessed as follows:
#' eight_datasets[[1]]
#' 
split <- function(X, y, prop_train, prop_validation, prop_test){
  
  #check that input proportions are numerics
  if (is.numeric(prop_train) == F |
       is.numeric(prop_validation) == F |
       is.numeric(prop_test) == F ){
    stop("Proportions must be numerics.")
  }
  
  #check that input proportions are non-negative, non-zero, and add up to 1.
  if (sum(prop_train * 100, 
          prop_test * 100, 
          prop_validation * 100) != 100 | 
      sign(prop_train) != 1 |
      sign(prop_test) != 1 |
      sign(prop_validation) != 1){
    stop("Input proportions should be non-negative, non-zero, floats that add to 1.")
  }
  
  #check that X is a dataframe
  if (is.data.frame(X) != T){
    stop("X needs to be a data.frame class but it's currently a different class.")
  }
  
  #check that y is a vector
  if (is.null(dim(y)) == F){
    stop("y needs to be a vector but it's currently a different class.")
  }
  
  #check that X and y have the same amount of rows.
  if (nrow(X) != length(y)){
    stop("X and y are don't have the same amount of rows. X and y need to number of rows.")
  }
  
  #calculate overall training size
  train_percentage <- prop_train + prop_validation
  
  #creating first split-- train and test set indices
  index1 <- createDataPartition(y = y, p = train_percentage, list = F)
  
  #creating train_validation set
  ydf <- as.data.frame(y)
  
  X_train_validation <- as.data.frame(X[index1,])
  y_train_validation <- ydf[index1,]
  
  #creating test set
  X_test <- as.data.frame(X[-index1,])
  y_test <- as.data.frame(ydf[-index1,])
  
  colnames(y_test) <- "target"
  
  #validation ratio
  validation_ratio <- 1 - round(prop_validation/(prop_train + prop_validation),2)
  
  #creating second split-- train and validation indices
  index2 <- createDataPartition(y = y_train_validation, p = validation_ratio, list = F)
  
  #creating train set
  y_train_validation <- as.data.frame(y_train_validation)
  colnames(y_train_validation) <- "target"
  
  X_train <- as.data.frame(X_train_validation[index2,])
  y_train <- as.data.frame(y_train_validation[index2,])
  colnames(y_train) <- "target"
  
  #creating validation set
  X_validation <- as.data.frame(X_train_validation[-index2,])
  y_validation <- as.data.frame(y_train_validation[-index2,])
  colnames(y_validation) <- "target"
  
  results <- list(X_train, y_train, X_validation, y_validation, X_train_validation, y_train_validation, X_test, y_test)
  
  return(results)
  
}