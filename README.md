# caretcompaR

### Authors:
| Authors   | Github    | CWL |
| --------------------- |-----------------------|------------|
| Birinder Singh | [birinder1469](https://github.com/birinder1469/) | bsingh02 |
| Jes Simkin | [jessimk](https://github.com/jessimk/) | jess354 |
| Talha Siddiqui | [talhaadnan100](https://github.com/talhaadnan100/) | talhaas |

### Summary

An `R` package facilitating beautifully efficient comparisons of machine learning classifiers and models.

__caretcompaR__ harnesses the power of <a href="https://topepo.github.io/caret/index.html">caret</a>, combining it with `R` dataframes for easy, breezy, and beautiful machine learning model and classifier exploration.   


### Functions:

- `train_test_acc()`   
 
	*The function creates a comparison of training and test scores using different models.*  
	
	*It takes in a list of caret regressors or classifiers, training input samples (features)* `X_train`*, test input samples (features)* `X_test`*, and their corresponding target values* `y_train` *and* `y_test` *(class labels in classification, real numbers in regression).*

	*Outputs a beautiful dataframe with train and test scores, and variance for each of the given caret regressors or classifiers. The results will be sorted by test score.*

	__Inputs:__   
	- List of caret regressors or classifiers,  type: `list('method')`
	- X train set, type: `data.frame()`
	- Y train set, type:  `data.frame()` or `list()`
	- X test set, type: `data.frame()`
	- Y test set, type:  `data.frame()` or `list()`

	__Outputs:__
	
	- Results, type: `data.frame()`

- `train_test_time()`  
  
	*The function creates a comparison of time it takes to fit and predict using different models.*  
	   
	   *It takes in a list of caret regressors or classifiers, training input samples* `X`*, and target values* `y` *(class labels in classification, real numbers in regression)*.

	*Outputs a beautiful dataframe with the time it takes for each model to fit and predict.*

	__Inputs:__   
	- List of caret regressors or classifiers,  type: `list('method')`
	- X set, type: `data.frame()`
	- Y set, type: `data.frame()` or `list()`

	__Outputs:__ 

	- Results, type: `data.frame()`

- `split()`

	*The function splits the training input samples* `X`*, and target values* `y` *(class labels in classification, real numbers in regression) into train, test and validation sets according to specified proportions.*

	*Outputs four* `X` *dataframes and four* `y` *lists. One each for training, validation, test, and combined training and validation.*

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

### Where does this package fit in?

This package provides functions to help make the early stages of model selection and exploration easier to cycle through and meaningfully compare.

Our idea for this package was to facilitate the comparison of machine learning classifiers and models. Our inspiration came from <a href="https://ubc-mds.github.io/descriptions/">UBC MDS DSCI 573</a> lab assignments where we learned to combine python's `sci-kit learn` with `pandas` in order to produce interpretable comparisons of train and test accuracies and time efficiencies across models. 

We are not currently aware of any packages that combine `caret` and dataframes for efficient and interpretable model-to-model comparisons. We expect that this combination is used in practice and after having used it while learning machine learning techniques during our UBC MDS courework, we thought it would be a good combination of tools to formally package together. 