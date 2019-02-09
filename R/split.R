#' Splitting data into train, validation, train_validation and test sets
#' 
#' This function splits the training set X, and target set y (class labels in classification, real numbers in regression) into 
#' train, validation, train & validation, and test sets according to specified proportions. Proportions must add up to 1.
#' 
#' Outputs four X dataframes and four y lists. One each for training, validation, test, and a combined training and validation set.

#'
#' @param X A dataframe of training data
#' @param y A dataframe of the target data
#' @param prop_train A float; proportion of data to be split into a training set. Prop_train, prop_test, and prop_validation need to add to 1.
#' @param prop_test A float; proportion of data to be split into a test set. Prop_train, prop_test, and prop_validation need to add to 1.
#' @param prop_validation A float; proportion of data to be split into a validation set. Prop_train, prop_test, and prop_validation need to add to 1.
#'
#' @return Four X dataframes and four y lists. One each for training, validation, test, and a combined training and validation set.
#' @export 
#'
#' @examples
#' split(X_dataset, y_dataset, 0.4, 0.2, 0.2)
#' split(X_toy_data, y_toy_data, 0.7, 0.1, 0.2)
split <- function(X, y, prop_train, prop_test, prop_validation){
  
  return(c(X_train, y_train, X_validation, y_validation, X_train_validation, y_train_validation, X_test, y_test))
}