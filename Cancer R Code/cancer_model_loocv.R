#Title: cancer_model_loocv
#Date: 31 May 2018
#Author: Kalea Sebesta
#Purpose: This script utilizes the leave-one-out-cv method to 
#construct a model on the original dataset
#-----------------------------------------------------
#libraries
#-----------------------------------------------------
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
# define training control
#-----------------------------------------------------
#leave one out cross validation
train_control <- trainControl(method="LOOCV")
#-----------------------------------------------------
# train the model
#-----------------------------------------------------
# train the model
model <- train(diagnosis~., data=cancer_df, trControl=train_control, method="nb")
#-----------------------------------------------------
# summarize results
#-----------------------------------------------------
print(model)
#-----------------------------------------------------