#' Title
#'
#' @param models 
#' @param X_train 
#' @param y_train 
#' @param X_test 
#' @param y_test 
#'
#' @return
#' @export
#'
#' @examples
#' 
#' 
#' 
train_test_acc_time <- function(models, X_train, y_train, X_test, y_test){
  
  result <- data.frame(model = c('lm','rf','knn','svmLinearWeights'), 
                        train_accuracy = runif(4,50,100),
                        test_accuracy = runif(4,50,100),
                        variance = runif(4,0,50),
                        fit_time = runif(4,1,6),
                        predict_time = runif(4,1,6),
                        total_time = runif(4,2,12))
  
  
  return(result)
}