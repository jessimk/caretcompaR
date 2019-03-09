<h5 align="center">
 <br>
<img src="logo.png" alt="caretcompaR" width="250"></a>
<br>
</h5>

<h4 align="center">Facilitating beautifully efficient comparisons of machine learning classifiers and regression models</a>.</h4>

<h5 align="center">
Created by</a></h5>

<h4 align="center">

[Birinder Singh](https://github.com/Birinder1469) &nbsp;&middot;&nbsp;
[Jes Simkin](https://github.com/jessimk) &nbsp;&middot;&nbsp;
[Talha Siddiqui](https://github.com/talhaadnan100)
</a></h4>

<br>
<h4 align="center">

[![Build Status](https://travis-ci.org/UBC-MDS/caretcompaR.svg?branch=master)](https://travis-ci.org/UBC-MDS/caretcompaR)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
[![codecov](https://codecov.io/gh/UBC-MDS/caretcompaR/branch/master/graph/badge.svg)](https://codecov.io/gh/UBC-MDS/caretcompaR)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
[![GitHub forks](https://img.shields.io/github/forks/UBC-MDS/caretcompaR.svg?style=social)](https://github.com/UBC-MDS/caretcompaR/network)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
[![GitHub issues](https://img.shields.io/github/issues/UBC-MDS/caretcompaR.svg?style=social)](https://github.com/UBC-MDS/caretcompaR/issues)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
[![GitHub stars](https://img.shields.io/github/stars/UBC-MDS/caretcompaR.svg?style=social)](https://github.com/UBC-MDS/caretcompaR/stargazers)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
[![GitHub license](https://img.shields.io/github/license/UBC-MDS/caretcompaR.svg?style=social)](https://github.com/UBC-MDS/caretcompaR/blob/master/LICENSE)
</a></h4>


<h1></h1>
<h4 align="center">
 <a href="#summary">Summary</a> &nbsp;&nbsp;&nbsp;•&nbsp;&nbsp;&nbsp;
 <a href="#install">Install</a> &nbsp;&nbsp;&nbsp;•&nbsp;&nbsp;&nbsp;
 <a href="#how-to-use">How To Use</a> &nbsp;&nbsp;&nbsp;•&nbsp;&nbsp;&nbsp;
 <a href="#credits">Credits</a> &nbsp;&nbsp;&nbsp;•&nbsp;&nbsp;&nbsp;
 <a href="#related">Related</a> &nbsp;&nbsp;&nbsp;•&nbsp;&nbsp;&nbsp;
 <a href="#license">License</a>&nbsp;&nbsp;&nbsp;•&nbsp;&nbsp;&nbsp;
 <a href="#contribute">Contribute</a>
</h4>
<h1></h1>

<br>

### Summary

An `R` package facilitating beautifully efficient comparisons of machine learning classifiers and models.

__caretcompaR__ harnesses the power of <a href="https://topepo.github.io/caret/index.html">caret</a>, combining it with `R` dataframes for easy, breezy, and beautiful machine learning regressors and classifiers exploration.   

*Looking to do the same in Python? Check out [SklearncomPYre](https://github.com/UBC-MDS/SklearncomPYre)!*

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

### Install

1. Install devtools from CRAN `install.packages("devtools", build_vignettes = TRUE)`
2. In an R environment, load devtools `library(devtools)`
3. Install caretcompaR from github `install_github("UBC-MDS/caretcompaR", build_vignettes = TRUE)`
4. Load caretcompaR `library(caretcompaR)`

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


### How To Use

```

#Loading in the data and splitting it into an X dataframe of features and a y 'Target' vector.
X <- iris[,1:4]
y <- iris$Species

head(X)
head(y)

#Splitting data into a training set, a validation set, a combined training and validation set, as well as a test set.
# The split will be 40% training, 30% validation, and 30% test.

glorious_datasets <- caretcompaR::split(X, y, 0.4, 0.3, 0.3)

#' Resulting dataframes are sorted in a list in this order:
#' 1. X_train ,
#' 2. y_train ,
#' 3. X_validation ,
#' 4. y_validation ,
#' 5. X_train_validation ,
#' 6. y_train_validation ,
#' 7. X_test ,
#' 8. y_test .

#Assigning our freshly split datasets so we can run some machine learning models
X_train <- glorious_datasets[[1]]
y_train <- glorious_datasets[[2]]

X_test <- glorious_datasets[[7]]
y_test <- glorious_datasets[[8]]

#Let's try these classifiers
models <- c('svmPoly','knn','rf')

#Running our chosen models on our data and building a beautiful summary
results_df <- caretcompaR::train_test_acc_time(models,X_train,y_train$target,X_test,y_test$target)

#Let's see how we did in terms of train accuracy, test accuracy, and timing
results_df

#Now let's also take a look at some plots to compare our models

# Plot the accuracy of the models
caretcompaR::comparison_viz(results_df,'accuracy')

# Plot the timing of the models
caretcompaR::comparison_viz(results_df,'time')

```

### Credits

* Function concepts inspired by [UBC MDS DSCI 573](https://ubc-mds.github.io/descriptions/) lab instructor [Varada Kolhatkar](https://kvarada.github.io/).
* README formatting inspiration from  [ptoolkit](https://github.com/UBC-MDS/ptoolkit).
* Badges by [Shields IO](https://shields.io/)
* Logo designed at [Canva](https://www.canva.com/)


### Related

#### Where does this package fit in?

This package provides functions to help make the early stages of model selection and exploration easier to cycle through and meaningfully compare.

Our idea for this package was to facilitate the comparison of machine learning classifiers and models. Our inspiration came from <a href="https://ubc-mds.github.io/descriptions/">UBC MDS DSCI 573</a> lab assignments where we learned to combine python's `sci-kit learn` with `pandas` in order to produce interpretable comparisons of train and test accuracies and time efficiencies across models.

We are not currently aware of any packages that combine `caret` and dataframes for efficient and interpretable model-to-model comparisons. We expect that this combination is used in practice and after having used it while learning machine learning techniques during our UBC MDS coursework, we thought it would be a good combination of tools to formally package together.

### License

[MIT License](https://github.com/UBC-MDS/SklearncomPYre/blob/master/LICENSE)

### Contribute

Interested in contributing?
See our [Contributing Guidelines](https://github.com/UBC-MDS/SklearncomPYre/blob/master/CONTRIBUTING.md) and [Code of Conduct](https://github.com/UBC-MDS/SklearncomPYre/blob/master/Conduct.md).
