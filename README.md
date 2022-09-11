# KNN with K-fold cross validation in R



## The data

* [Kaggle heart dataset](https://www.kaggle.com/datasets/uciml/glass)
* Rows 1-9 are predictive
* Row 10 is the category: 1-7
* [Click here to view the detailed data report](https://chardur.github.io/knn-example-R/report.html)

## Model

You can view the code for the model in [knn-example.R](https://github.com/chardur/knn-example-R/blob/main/knn-example.R) in this repo. A simple linear kernel is used for illustration.


* The data is shuffled to minimize random effects and effects from sorted data
* The data is then split into 2 datasets: Training(train the model), Test(estimate performance of the model)
* It is important to scale the data ! I used the caret preProcess(center, scale) function in this model.


To find the best model I ... 
Once a model is chosen, it is then tested with the test data to estimate the final performance.

## Analysis

[Click here to view the data analysis report](https://chardur.github.io/knn-example-R/report.html)


Graphing the relationship between 
<img src="cvalues.jpeg" alt="image"> 


The [data report](https://chardur.github.io/SVM-Example-R/report.html) correlation analysis indicated that CP (chest pain) and thalachh (maximum heart rate) had high correlation with output. Here is a graph with these two features:
<img src="scatter-graph-original.jpg" alt="image"> 



### Dependencies

* RStudio or similar
* caret library
* ggplot2 library for graphs

### Executing program

* Run the knn-example.R script in RStudio or similar

```
code blocks for commands
```

## Acknowledgments

* [UCI glass dataset](https://www.kaggle.com/datasets/uciml/glass)
* [Based on GATECH ISYE6501 course, Dr Joel Sokol](https://omscs.gatech.edu/current-courses)
