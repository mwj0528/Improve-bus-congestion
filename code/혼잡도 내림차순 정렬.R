library(dplyr)
setwd("C:/Users/User/Desktop/데프실_팀플")
data <- read.csv("혼잡도.csv")

data <- data %>%
  mutate(max=pmax(!!!select(.,5:28),na.rm=TRUE))
data <- data %>%
  arrange(desc(max))

desc_crowd <- data %>%
  distinct(노선,.keep_all=TRUE)

head(desc_crowd[,1])

write.csv(desc_crowd,"노선별 최대 혼잡도 정렬.csv",fileEncoding="UTF-8",row.names=FALSE)

rm(list=ls())
