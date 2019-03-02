#' Generating Model Comparison Viz
#'
#' This function visualizes the output of train_test_acc_time() for easy communication and interpretation. The user has the choice to visualize a comparison of accuracies or time. 
#' 
#' This function outputs a beautiful ggplot bar chart comparison of different models' training and test scores or the time it takes to fit and predict.
#'
#' @param comparison A dataframe, the output of train_test_acc_time(). Dimensions are 7 columns and at least 1 row.
#' @param choice String, selecting the desired comparison visualization; either "accuracy" or "time". Default value is 'accuracy'.
#'
#' @return PNG image; A bar chart of accuracies or a time comparison bar chart, saved to root directory.
#' @export
#' 
#' @import tidyr
#' @import ggplot2
#'
#' @examples
#' results_dataframe <- data.frame(model = c('svmPoly','knn','rf'), 
#' Train_acc = runif(3,0,1), 
#' Test_acc = runif(3,0,1), 
#' Variance = runif(3,0,1), 
#' Fit_Time = runif(3,0,4), 
#' Predict_Time = runif(3,0,4), 
#' Total_Time = runif(3,0,4))
#' comparison_viz(results_dataframe)
#' comparison_viz(results_dataframe, "time")
#' 
comparison_viz <- function(comparison, choice = "accuracy"){
  
  #########
  # TESTS #
  #########
  
  if(is.null(comparison)){
    stop("Input is not correct")
  }
  
  if(is.data.frame(comparison) == FALSE){
    stop("Comparison must be a dataframe")
  }
  
  if(dim(comparison)[2]!=7){
    stop("Comparison dataframe must have 7 columns")
  }
  
  if(dim(comparison)[1] < 1){
    stop("Comparison dataframe has row(s) missing")
  }
  
  if(all(sapply(comparison, typeof) ==
         c("integer", "double", "double", 
           "double", "double", "double", "double")) == FALSE){
    stop("Comparison dataframe has incorrect column value types")
  }
  
  if(is.character(choice) == FALSE){
    stop("Choice input must be string")
  }
  
  if((choice == "accuracy" | choice == "time") == FALSE){
    stop("Choice input must either be 'time' or 'accuracy'")
  }
  
  #################
  # FUNCTION CODE #
  #################
  
  if(choice=="time"){
    comparison <- comparison[-4][-3][-2]
  }
  
  comparison_gathered <- tidyr::gather(comparison[1:3], 
                                key = Type, value = Accuracy, 
                                names(comparison)[2], names(comparison)[3])
  
  comparison_visualization <- ggplot2::ggplot(comparison_gathered, aes(model, Accuracy)) + 
    ggplot2::geom_bar(aes(fill = Type), stat = "identity", position = "dodge") + 
    ggplot2::labs(
      title = paste("Comparison of", choice),
      x = "Model",
      y = choice
    )
  
  ##########
  # OUTPUT #
  ##########
  
  ggplot2::ggsave(paste0(choice,".png"), comparison_visualization)
}
