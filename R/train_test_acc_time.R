#' Comparing different models and their accuracies and times
#'
#' This function compares different caret regressors or classifiers in terms of training and test accuracies, and the time it takes to fit and predict. The function inputs are list of models, training data and a training target data (Xtrain and ytrain), as well as a test feature data and test target data (continuous or categorical, Xtest, ytest). 
#' 
#' The function outputs a beautiful dataframe with training & test scores, model variance, and the time it takes to fit and predict using different models.
#' 
#' @param models A list of classifiers 
#' @param X_train A dataframe of training data (features)
#' @param y_train A dataframe or list of training target data
#' @param X_test A dataframe of test data (features)
#' @param y_test A dataframe or list of test target data
#'
#' @return A dataframe of results with 7 columns: classifer name, training accuracy, test accuracy, model variance, time to fit, time to predict, and total time. Results are sorted by test accuracy in descending order.
#' @export
#'
#' @examples
#' train_test_acc_time(Models, Xtrain_data, ytrain_data, Xtest_data, ytest_data)
#' 
train_test_acc_time <- function(models, X_train, y_train, X_test, y_test){
  
  return(result)
}