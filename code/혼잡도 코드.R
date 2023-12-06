library(dplyr)

board_1023 <- read.csv("1023_재차인원.csv")
board_1024 <- read.csv("1024_재차인원.csv")
board_1025 <- read.csv("1025_재차인원.csv")
board_1026 <- read.csv("1026_재차인원.csv")
board_1027 <- read.csv("1027_재차인원.csv")


file_paths <- c("1023_재차인원.csv","1024_재차인원.csv",
                "1025_재차인원.csv","1026_재차인원.csv","1027_재차인원.csv")

board_mean <- read.csv(file_paths[1], header = TRUE)

# 나머지 파일 읽어서 같은 행의 문자열 값은 1번 파일과 동일하게 설정하고, 같은 행/열의 숫자 값에 대해 합 계산
for (file_path in file_paths[-1]) {
  data <- read.csv(file_path, header = TRUE)
  
  # 같은 행의 문자열 값은 1번 파일과 동일하게 설정
  data[, 1:4] <- board_mean[, 1:4]
  
  # 같은 행/열의 숫자 값에 대해 합 계산
  board_mean[, 5:ncol(board_mean)] <- (board_mean[, 5:ncol(board_mean)] + data[, 5:ncol(data)])
}

board_mean[,5:28] <- board_mean[,5:28]/5 # 평균으로 변환

write.csv(board_mean,"평균_재차인원.csv",fileEncoding="UTF-8",row.names=FALSE)


degree_crowd <- data.frame(     
  노선=board_mean$노선,
  기종점=board_mean$기종점,
  순번=board_mean$순번,
  정류장명=board_mean$정류장명
)    # 혼잡도 데이터프레임 생성
  

degree_crowd[, 5:ncol(board_mean)] <- lapply(board_mean[, 5:ncol(board_mean)], function(x) x / 40) 
# 혼잡도 계산

write.csv(degree_crowd,"혼잡도.csv",fileEncoding="UTF-8",row.names=FALSE)


