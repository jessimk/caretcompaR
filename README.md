# [ML Compare Package]

### Authors:
| Authors   | Github    | CWL |
| --------------------- |-----------------------|------------|
| Jes Simkin | [jessimk](https://github.com/jessimk/) | jess354 |
| Birinder Singh | [birinder1469](https://github.com/birinder1469/) | bsingh02 |
| Talha Siddiqui | [talhaadnan100](https://github.com/talhaadnan100/) | talhaas |

### Summary

a summary paragraph that describes the project at a high level

a bulleted list of the functions (and datasets if applicable) that will be included in the package (this should be a 1-2 sentence description for each function/dataset)

[MLCOMPARE] tidy ML classifier comparisons.

### Functions:

- `train_test_acc()`  
	*The function creates a comparison of training and test scores using different models. It takes in a list of caret regressors or classifiers, training input samples (features)* `X_train`*, test input samples (features)* `X_test`*, and their corresponding target values* `y_train` *and* `y_test` *(class labels in classification, real numbers in regression).*

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

	*The function creates a comparison of time it takes to fit and predict using different models. It takes in a list of caret regressors or classifiers, training input samples* `X`*, and target values* `y` *(class labels in classification, real numbers in regression).

	Outputs a beautiful dataframe with the time it takes for each model to fit and predict.*

	__Inputs:__   
	- List of caret regressors or classifiers,  type: `list('method')`
	- X set, type: `data.frame()`
	- Y set, type: `data.frame()` or `list()`

	__Outputs:__
	- Results, type: `data.frame()`

- `split()`

	*The function splits the training input samples* `X`*, and target values* `y` *(class labels in classification, real numbers in regression) into train, test and validation sets according to specified ratios.

	Outputs four* `X` *dataframes and four* `y` *lists. One each for training, validation, test, and combined training and validation.*

	__Inputs:__
	- X set, type: `data.frame()`
	- Y set, type: `data.frame()` or `list()`
	- train ratio, type: `float`
	- test ratio, type: `float`
	- validation ratio, type: `float`

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

a paragraph describing where your packages fit into the Python and R ecosystems (are there any other Python or R software packages that have the same/similar functionality? Provide links to any that do. if none exist, then clearly state this as well).
