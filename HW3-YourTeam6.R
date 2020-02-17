#to set directory
setwd(choose.dir())
titanic <- read.csv("C:/Users/mzald/Desktop/0 UHD Folder/CS 5310 Data Mining/titanic_traning.csv")

#find the missing values (MV) for the features
MV <- sapply(titanic, function(x)sum(is.na(x)))
MV <- data.frame(MV)
MV <- MV[-c(1),,drop=F]
#find the percent of MV
library(MASS)
n <- nrow(titanic)
MVpercent <- round(MV/n, digits = 4)
MV <- cbind(MV, MVpercent)

#inconsistency for sex
features <-data.frame( IV = matrix(0, nrow = 8, ncol = 1))
features[2,1] <- sum((titanic$sex == "Male") | (titanic$sex == "Female"))
features[7,1] <- sum(titanic$embarked == "Queenstown")
MV <- cbind(MV, features)

IVpercent <- round(features/n, digits = 4)
MV <- cbind(MV, IVpercent)

#--------------------------------------------------------------------------------------------
#I'm still fixing ignore the rest of the code
incon <- sapply(titanic, levels)
incon
#the inconsistencies in the feature of "embarked" should only be 2, because "Queenstown" and "Q" mean the same
#in extent "C", "S", and "Q" are the only true levels for this feature
incon[[1]]<-NULL
IV <- data.frame(IV=lengths(incon))
IV$IV[7]<-2
MV <- cbind(MV, IV)