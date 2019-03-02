#' Comparing different models and their accuracies and times
#'
#' This function compares different caret regressors or classifiers in terms of training and test accuracies, and the time it takes to fit and predict. The function inputs are list of models, training data and a training target data (Xtrain and ytrain), as well as a test feature data and test target data (continuous or categorical, Xtest, ytest). 
#' 
#' The function outputs a beautiful dataframe with training & test scores, model variance, and the time it takes to fit and predict using different models.
#' 
#' @param models A list of classifiers 
#' @param X_train A dataframe of training data (features)
#' @param y_train A vector of training target data
#' @param X_test A dataframe of test data (features)
#' @param y_test A vector of test target data
#'
#' @return A dataframe of results with 7 columns: classifer name, training accuracy, test accuracy, model variance, time to fit, time to predict, and total time. Results are sorted by test accuracy in descending order.
#' 
#' @import caret
#' @import stats
#' 
#' @export
#'
#' @examples
#' library(caret)
#' idx <- createDataPartition(iris$Species,p = 0.75,list=FALSE)
#' train_iris <- iris[idx,]
#' test_iris <- iris[-idx,]
#' Xtrain <- train_iris[,names(iris)!='Species'] 
#' ytrain <- train_iris[,names(iris)=='Species'] 
#' Xtest <- test_iris[,names(iris)!='Species'] 
#' ytest <- test_iris[,names(iris)=='Species'] 
#' models <- c('svmPoly','knn','rf')
#' train_test_acc_time(models, Xtrain, ytrain, Xtest, ytest)
#' 
train_test_acc_time <- function(models, X_train, y_train, X_test, y_test){
  
  if(is.null(models)||is.null(c(X_train,X_test,y_train,y_test)) ){
    stop("Input is not correct")
    #stop(ifnot(is.atomic(models)))
  }
  
  result_df <- data.frame()
  
  for (i in models){
    
    start.time <- Sys.time()
    model_fit <- caret::train(X_train,y_train, method= i)
    end.time <- Sys.time()
    time_fit <- end.time-start.time
    
    start.time2 <- Sys.time()
    train_accuracy <- caret::confusionMatrix(stats::predict(model_fit,X_train),y_train)$overall[[1]]
    end.time2 <- Sys.time()  
    time_predict <- end.time2-start.time2
    
    test_accuracy <- caret::confusionMatrix(stats::predict(model_fit,X_test),y_test)$overall[[1]]
    row1 <- data.frame(model=c(i),Train_acc=c(train_accuracy), 
                       Test_acc=c(test_accuracy),
                       Variance = train_accuracy - test_accuracy,
                       Fit_Time=c(time_fit),
                       Predict_Time=c(time_predict),
                       Total_Time=time_fit+time_predict)
    result_df <- rbind(row1,result_df)
    
  }
  
  result <- result_df[order(-result_df$Test_acc),]


  return(result)
}



