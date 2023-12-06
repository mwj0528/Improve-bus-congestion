library(dplyr)

data <- read.csv("혼잡도.csv")

average_values <- data %>%
  summarise(across(5:28, mean, na.rm = TRUE))

sorted_columns <- names(average_values)[order(-unlist(average_values))]

head(sorted_columns)

# 7,8,9,16,17,18 을 출퇴근시간으로 선정
write.csv(average_values,"시간별 평균 혼잡도 (내림차순).csv",fileEncoding="UTF-8",row.names = FALSE)
write.csv(sorted_columns,"혼잡도 높은 시간순서.csv",fileEncoding="UTF-8",row.names=FALSE)
