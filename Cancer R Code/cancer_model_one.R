#Title: cancer_model_one
#Date: 31 May 2018
#Author: Kalea Sebesta
#Purpose: This script splits the unbalanced non transformed 
#dataset (original dataset) and trains the model on 80% and
#tests it on 20%. NaiveBayes algorithm is used to create the
#model and the prediction results are displayed
#-----------------------------------------------------
#libraries
library(bnlearn)
library(caTools)
library(deal)
library(e1071)
library(caret)
library(klaR)
#-----------------------------------------------------
#load data and preprocess
#-----------------------------------------------------
setwd("/Users/kaleasebesta/Downloads")
getwd()
data=read.csv("data.csv")
data <- subset( data, select = -X)
data <- subset(data, select = -id)
cancer_df=as.data.frame(data)

#-----------------------------------------------------
#split data
#-----------------------------------------------------
# define an 80%/20% train/test split of the dataset
split=0.80
trainIndex <- createDataPartition(cancer_df$diagnosis, p=split, list=FALSE)
data_train <- cancer_df[ trainIndex,]
data_test <- cancer_df[-trainIndex,]
#----------------------------------------------------
# train a naive bayes model
#----------------------------------------------------
model <- NaiveBayes(diagnosis~., data=data_train)

#----------------------------------------------------
# make predictions
#----------------------------------------------------
x_test <- data_test[,2:31]
y_test <- data_test[,1]
predictions <- predict(model, x_test)
#----------------------------------------------------
# summarize results
#----------------------------------------------------
confusionMatrix(predictions$class, y_test)

#----------------------------------------------------






