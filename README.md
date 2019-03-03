# caretcompaR


| Contributor                  | Github              | CWL |
| --------------------- |-----------------------|-----------------------|
| Birinder Singh | [birinder1469](https://github.com/Birinder1469) | bsingh02 |
| Jes Simkin | [jessimk](https://github.com/jessimk) | jess354 |
| Talha Siddiqui | [talhaadnan100](https://github.com/talhaadnan100) | talhaas |

### Summary

An `R` package facilitating beautifully efficient comparisons of machine learning classifiers and models.

__caretcompaR__ harnesses the power of <a href="https://topepo.github.io/caret/index.html">caret</a>, combining it with `R` dataframes for easy, breezy, and beautiful machine learning regressors and classifiers exploration.   

### Installation

1. Install devtools from CRAN `install.packages("devtools", build_vignettes = TRUE)`
2. In an R environment, load devtools `library(devtools)`
3. Install caretcompaR from github `install_github("UBC-MDS/caretcompaR", build_vignettes = TRUE)`
4. Load caretcompaR `library(caretcompaR)`

See the package vignette for detailed usage info. 

### The ML models available for testing  

| Model Name / Software Packages                 | Method Value             | Version | Libraries|
| --------------------- |-----------------------| ----|---|
| SVM Polynomial  | svmPoly |0.9.27  | kernlab|
| SVM Linear | svmLinear |0.9.27  | kernlab|
| Knn | knn |0.9.3  | |
| Random Forest | rf | 4.6.14 |randomForest |
| Naive Bayes | naive_bayes  | 0.9.3 | naivebayes|
| caret | caret |  6.0.81| caret |
| R version | R version |  3.5.2 | |


While running the package the dictionary should contain the Method value in the list of models.
```
For example :
models <- c('svmPoly','knn','rf','svmLinear','naive_bayes')
```

For further details please refer to the caret package url : [caret_package](http://topepo.github.io/caret/available-models.html)  


#### Function 1 :

- `split()`

	The function splits the training input samples `X`, and target values `y` (class labels in classification, real numbers in regression) into train, test and validation sets according to specified proportions.

	Outputs four `X` dataframes and four `y` lists. One each for training, validation, test, and combined training and validation.

	__Inputs:__
	- X set, type: `data.frame()`
	- Y set, type: `data.frame()` or `list()`
	- proportion of train data, type: `float`
	- proportion of validation data, type: `float`
	- proportion of test data, type: `float`

	__Outputs:__  

	- X train set, type: `data.frame()`
	- y train, type: `list()`
	- X validation set, type: `data.frame()`
	- y validation, type: `list()`
	- X train and validation set, type: `data.frame()`
	- y train and validation, type: `list()`
	- X test set, type: `data.frame()`
  - y test, type: `list()`

#### Function 2 :

- `train_test_acc_time()`

	The purpose of this function is to compare different caret regressors or classifiers in terms of training and test accuracies, and the time it takes to fit and predict. The function inputs are list of models, input train samples `Xtrain`(input features), input test samples `Xtest`, target train values `ytrain` and target test values `ytest` (continuous or categorical).
	
  The function outputs a beautiful dataframe with training & test scores, model variance, and the time it takes to fit and predict using different models.

	__Inputs:__   
	- List of caret regressors or classifiers,  type: `list('method')`
	- X train set, type: `data.frame()`
	- Y train set, type:  `data.frame()` or `list()`
	- X test set, type: `data.frame()`
	- Y test set, type:  `data.frame()` or `list()`

	__Outputs:__

	- Dataframe with 7 columns: (1) regressor or classifier name, (2) training accuracy, (3) test accuracy, (4) model variance, (5) time it takes to fit, (6) time it takes to predict and (7) total time. The dataframe will be sorted by test score in descending order. Type: `data.frame()`

#### Function 3 :

- `comparison_viz()`  

  The purpose of this function is to visualize the output of `train_test_acc_time()` for easy communication and interpretation. The user has the choice to visualize a comparison of accuracies or time. It takes in a dataframe with 7 attributes i.e. model name, training & test scores, model variance, and the time it takes to fit, predict and total time. <br>
  Outputs a beautiful <a href="https://ggplot2.tidyverse.org/">ggplot</a> bar chart comparison of different models' training and test scores or the time it takes to fit and predict. <br>

	__Inputs:__   
	- Dataframe with 7 columns: (1) regressor or classifier name, (2) training accuracy, (3) test accuracy, (4) model variance, (5) time it takes to fit, (6) time it takes to predict and (7) total time. Type: `data.frame()`
  - Choice of `accuracy` or `time`. Type: `string`

	__Outputs:__

	- Bar chart of accuracies or time comparison by models saved to root directory. Type: `png`

### Where does this package fit in?

This package provides functions to help make the early stages of model selection and exploration easier to cycle through and meaningfully compare.

Our idea for this package was to facilitate the comparison of machine learning classifiers and models. Our inspiration came from <a href="https://ubc-mds.github.io/descriptions/">UBC MDS DSCI 573</a> lab assignments where we learned to combine python's `sci-kit learn` with `pandas` in order to produce interpretable comparisons of train and test accuracies and time efficiencies across models.

We are not currently aware of any packages that combine `caret` and dataframes for efficient and interpretable model-to-model comparisons. We expect that this combination is used in practice and after having used it while learning machine learning techniques during our UBC MDS courework, we thought it would be a good combination of tools to formally package together.

