library(ggplot2)
setwd("C:/Users/User/Desktop/데프실_팀플")
data <- read.csv("원래 혼잡도.csv")
crowd_del1 <- read.csv("좌석제거 후 혼잡도(25%).csv")
crowd_del2 <- read.csv("좌석제거 후 혼잡도(50%).csv")
crowd_del3 <- read.csv("좌석제거 후 혼잡도(75%).csv")
crowd_del4 <- read.csv("좌석제거 후 혼잡도(100%).csv")


time <- c(7,8,9,17,18,19)
select <- c(1,5,6,7,8,9,10)
col_name <- c('507번','741번','140번','463번','421번')

par(mfrow=c(2,3))

subset_data <- t(data[, 5:10])
colnames(subset_data) <- col_name
boxplot(subset_data,ylim=c(0,2),main="좌석 제거 전 혼잡도",col=c(2:6))

subset_del1 <- t(crowd_del1[, 5:10])
colnames(subset_del1) <- col_name
boxplot(subset_del1,ylim=c(0,2),main="좌석 제거(25%) 후 혼잡도",col=c(2:6))

subset_del2 <- t(crowd_del2[, 5:10])
colnames(subset_del2) <- col_name
boxplot(subset_del2,ylim=c(0,2),main="좌석 제거(50%) 후 혼잡도",col=c(2:6))

subset_del3 <- t(crowd_del3[, 5:10])
colnames(subset_del3) <- col_name
boxplot(subset_del3,ylim=c(0,2),main="좌석 제거(75%) 후 혼잡도",col=c(2:6))

subset_del4 <- t(crowd_del4[, 5:10])
colnames(subset_del4) <- col_name
boxplot(subset_del4,ylim=c(0,2),main="좌석 제거(100%) 후 혼잡도",col=c(2:6))

par(mfrow=c(1,1))
