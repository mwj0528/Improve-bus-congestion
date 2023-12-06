library(ggplot2)
library(dplyr)
library(tidyr)

data <- read.csv("C:/Users/User/Desktop/데프실_팀플/혼잡도 정렬.csv")
long <- c(1:14)
time <- c(0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23)
title <- c(data[,1])

order <- c(1:4,25:28,5:24)
data <- data[,order]

par(mfrow=c(3,5))

for (i in long){
  con <- c(data[i,5:28])
  con <- unlist(con)
  plot(con~time,main=title[i],col=i,pch=i,type='o',ylab="최대혼잡도",xlab="시간대")
}

par(mfrow=c(1,1))

