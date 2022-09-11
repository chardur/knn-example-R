# clear variables, load libraries, set seed
rm(list = ls())
library(caret)
library(ggplot2)
set.seed(13)

# read the data
df <-  read.csv('./glass.csv', header=TRUE)
data <-  data.matrix(df)

# Optional Explore the data quickly
#library(DataExplorer)
#DataExplorer::create_report(df)

# shuffle data to minimize random effects
shuffled_df <-  df[sample(nrow(df)),]

# create training 90% and test 10%, 
train <- createDataPartition(shuffled_df$Type, p = 0.9, list = FALSE, times = 1)
df_train <- shuffled_df[train,]
df_test <- shuffled_df[-train,]

# build the model
model <- train(as.factor(Type)~.,
                 df_train,
                 method = "knn", # choose knn model
                 trControl=trainControl(
                   method="repeatedcv", # k-fold cross validation
                   number=10, # number of folds (k in cross validation)
                   repeats=5), # number of times to repeat k-fold cross validation
                 preProcess = c("center", "scale"), # standardize the data
                 tuneGrid = expand.grid(k=3:15)) # min/max number of k neighbors use odd nums to avoid ties

plot(model$results$k, model$results$Accuracy, type = "o", col = "blue", xlab = "K value", ylab = "Accuracy",
     main = "K vs Accuracy, 10 fold CV, CARET")

# Now test the model
pred <- predict(model, df_test)
score <- (sum(pred == df_test$Type) / nrow(df_test))
score

# Graph the observed points
dev.new()
ggplot(df_test, aes(Al, Na, color = as.factor(Type))) + geom_point() +ggtitle("Al, Na vs Type: Observed")

# Graph the predicted
dev.new()
ggplot(df_test, aes(Al, Na, color = as.factor(pred))) + geom_point() +ggtitle("Al, Na vs Type: Predicted")

# observed and predicted on same graph
dev.new()
ggplot(df_test) + geom_point(aes(Al, Na, color = as.factor(Type))) + geom_point(aes(Al, Na, color = as.factor(pred)), shape=1, size=4)

