#' Generating Model Comparison Viz
#'
#' This function visualizes the output of train_test_acc_time() for easy communication and interpretation. The user has the choice to visualize a comparison of accuracies or time. 
#' 
#' This function outputs a beautiful ggplot bar chart comparison of different models' training and test scores or the time it takes to fit and predict.
#'
#' @param comparison A dataframe, the output of train_test_acc_time(). Dimensions are 7 columns and at least 1 row.
#' @param choice String, selecting the desired comparison visualization; either "accuracy" or "time".
#'
#' @return PNG image; A bar chart of accuracies or a time comparison bar chart, saved to root directory.
#' @export
#'
#' @examples
#' comparison_viz(results_dataframe, "accuracy")
#' comparison_viz(results_dataframe, "time")
#' 
comparison_viz <- function(comparison, choice){
  
  assert("Comparison must be a dataframe", is.data.frame(comparison))
  assert("Comparison dataframe must have 7 columns", dim(comparison)[2]==7)
  assert("Comparison dataframe has row(s) missing", dim(comparison)[1]>=1)
  assert("Comparison dataframe has incorrect column value types",
         all(sapply(comparison, typeof)==c("integer", "double", "double", "double", "double", "double", "double")))
  assert("Choice input must be string", is.character(choice))
  assert("Choice input must either be 'time' or 'accuracy'", choice == "accuracy" | choice == "time")
  
  if(choice=="time"){
    comparison <- comparison[-4][-3][-2]
  }
  
  comparison_gathered <- gather(comparison[1:3], 
                                key = Type, value = Accuracy, 
                                names(comparison)[2], names(comparison)[3])
  
  comparison_visualization <- ggplot(comparison_gathered, aes(model, Accuracy)) + 
    geom_bar(aes(fill = type), stat = "identity", position = "dodge")
  
  ggsave(paste0(choice,".png"), comparison_visualization)
}