context("test-comparison_viz")

# SAMPLE DATA
df <- data.frame(model = c('lm','rf','knn','svmLinearWeights'), 
                 train_accuracy = runif(4,50,100),
                 test_accuracy = runif(4,50,100),
                 variance = runif(4,0,50),
                 fit_time = runif(4,1,6),
                 predict_time = runif(4,1,6),
                 total_time = runif(4,2,12)
                 )

# Input 'Comparison' dataframe tests

test_that("whether 1st input is a dataframe", {
  expect_error(comparison_viz("a","time"),
               "Comparison must be a dataframe")
})

test_that("Input dataframe has seven columns", {
  expect_error(comparison_viz(df[-7],"time"),
               "Comparison dataframe has column(s) missing")
  expect_error(comparison_viz(cbind(df,df),"time"),
               "Comparison dataframe has extra column(s)")
})

test_that("Input dataframe has atleast 1 row", {
  expect_error(comparison_viz(df[-c(1:4),],"time"),
               "Comparison dataframe has row(s) missing")
})

test_that("Input dataframe has correct column value types", {
  expect_error(comparison_viz(replace(df,c(1),2),"time"),
               "Model column must be string")
  expect_error(comparison_viz(replace(df, c(2), "a"),"time"),
               "Training accuracy column must be integer or double")
  expect_error(comparison_viz(replace(df, c(3), "a"),"time"),
               "Test accuracy column must be integer or double")
  expect_error(comparison_viz(replace(df, c(4), "a"),"time"),
               "Variance column must be integer or double")
  expect_error(comparison_viz(replace(df, c(5), "a"),"time"),
               "Fit time column must be integer or double")
  expect_error(comparison_viz(replace(df, c(6), "a"),"time"),
               "Predict time column must be integer or double")
  expect_error(comparison_viz(replace(df, c(7), "a"),"time"),
               "Total time column must be integer or double")
})

# Input 'Choice' string tests

test_that("whether 2nd input is a string", {
  expect_error(comparison_viz(df,123),
               "Choice input must be string")
})

test_that("Input string is either accuracy or time", {
  expect_error(comparison_viz(df,"123"),
               "Choice input must either be 'time' or 'accuracy'")
})

# Other input

test_that("insufficient input", {
  expect_error(comparison_viz(df),
               "Choice input is missing")
  expect_error(comparison_viz(choice = 'time'),
               "Comparison dataframe is missing")
})

test_that("third input", {
  expect_error(comparison_viz(df,"time", "123"),
               "Extra input provided")
})




