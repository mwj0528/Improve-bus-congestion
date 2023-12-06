setwd("C:/Users/User/Desktop/데프실_팀플")
data <- read.csv("원래 혼잡도.csv")
plus_bus <- read.csv("추가 배차 후 혼잡도.csv")


time <- c(7,8,9,17,18,19)
select <- c(1,5,6,7,8,9,10)
col_name <- c('507번','741번','140번','463번','421번')

par(mfrow=c(1,2))

subset_data <- t(data[, 5:10])
colnames(subset_data) <- col_name
boxplot(subset_data,ylim=c(0,2),main="추가 배차 전 혼잡도",col=c(2:6))

subset_plus <- t(plus_bus[, 5:10])
colnames(subset_plus) <- col_name
boxplot(subset_plus,ylim=c(0,2),main="추가 배차 후 혼잡도",col=c(2:6))
