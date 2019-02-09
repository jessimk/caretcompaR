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
  
  save.image()
}