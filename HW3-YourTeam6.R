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
incon <- sapply(titanic, levels)
incon
#the inconsistencies in the feature of "embarked" should only be 2, because "Queenstown" and "Q" mean the same
#in extent "C", "S", and "Q" are the only true levels for this feature
incon[[1]]<-NULL
IV <- data.frame(IV=lengths(incon))
IV$IV[7]<-2
MV <- cbind(MV, IV)