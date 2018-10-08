#Title: frequencyPlots
#Author: Kalea Sebesta
#Date: 24 May 2018
#Purpose: This script reads in the cancer data set and 
#performs the necessary cleaning procedures and then
#plots the frequency distribution plots for the numeric
#variables.

#------------------------------------------------------#
#libraries
#------------------------------------------------------#
library(ggplot2)

#------------------------------------------------------#
#set directory and read in data
setwd("/Users/kaleasebesta/Downloads")
data=read.csv("data.csv")

#------------------------------------------------------#
#data preprocessing
#------------------------------------------------------#
#X variable added into the dataframe and we need to drop it
data <- subset( data, select = -X)
data <- subset(data, select = -id)

#------------------------------------------------------#
#graph data
#------------------------------------------------------#
#graph frequency of continuous variables in data set
names<-names(data)
classes<-sapply(data,class)
par(mfrow = c(2, 2))  # Set up a 2 x 2 plotting space
for(name in names[classes == 'numeric'])
{
  # store data in column.i as x
  x <- data[,name]
  
  # Plot histogram of x
  hist(x,
       main = paste("Feature:", name),
       xlab = "Value")
}
#------------------------------------------------------#