#Title: DAG_Creatation_Mean_Data
#Author: Kalea Sebesta
#Date: 22 May 2018
#Purpose: This script calls the deal library and reads 
#in the breast cancer data and creates a DAG using the 
#heuristic approach in deal.
#------------------------------------------------------#
#------------------------------------------------------#
#call libraries
#------------------------------------------------------#
library(bnlearn)
library(deal)
library(Hmisc)
library(tidyr)

#------------------------------------------------------#
#set working directory and read data
#------------------------------------------------------#
setwd("/Users/kaleasebesta/Downloads")
data=read.csv("data.csv")

#------------------------------------------------------#
#data cleaning
#------------------------------------------------------#
#X variable added into the dataframe and we need to drop it
#and the id column
data <- subset( data, select = -X)
data <- subset(data, select = -id)

#split the data into the mean, se, and worst and perform 
#bayesian plots of those
dataMean=subset(data, select = c(radius_mean, diagnosis, 
                                 texture_mean, perimeter_mean, 
                                 area_mean, smoothness_mean, 
                                 compactness_mean, concavity_mean, 
                                 concave.points_mean, symmetry_mean, 
                                 fractal_dimension_mean))

dataSE=subset(data, select = c(radius_se, diagnosis, texture_se, 
                               perimeter_se, area_se, smoothness_se, 
                               compactness_se, concavity_se, concave.points_se, 
                               symmetry_se, fractal_dimension_se))

dataWorst=subset(data, select = c(radius_worst, diagnosis, texture_worst, 
                                  perimeter_worst, area_worst, smoothness_worst, 
                                  compactness_worst, concavity_worst, 
                                  concave.points_worst, symmetry_worst, 
                                  fractal_dimension_worst))

#------------------------------------------------------#
#Using 'deal' create DAG for the subset of data that
#represents the mean values of the 10 variables
#------------------------------------------------------#
mdata.nw<- network(dataMean)   
mdata.prior <- jointprior(mdata.nw)
mdata.nw   <- learn(mdata.nw,dataMean,mdata.prior)$nw
resultMean   <- heuristic(mdata.nw,dataMean,mdata.prior,restart=2,degree=4,trace=TRUE)
thebest  <- resultMean$nw[[1]]

#------------------------------------------------------#
#calculate the probabilities
#------------------------------------------------------#
#change diagnosis to factor prior to getting probabilities
dataMean[,'diagnosis']<-factor(dataMean[,'diagnosis'])
prob(mdata.nw,dataMean)
localprob(mdata.nw)
