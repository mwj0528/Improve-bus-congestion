# 산점도를 통해 시간대는 7,8,9,17,18,19로 축소
# 최대혼잡도가 높은 상위 5개 노선으로 축소
# 좌석 하나 제거당 1명 수용 -> 2명 수용 가능하다고 가정

setwd("C:/Users/User/Desktop/데프실_팀플")
data <- read.csv("노선별 최대 혼잡도 정렬.csv")
select <- c(1,2,3,4,8,9,10,18,19,20)
data <- data[,select]
data <- data[1:5,]

board_mean <- data.frame(     
  노선=data$노선,
  기종점=data$기종점,
  순번=data$순번,
  정류장명=data$정류장명
)
board_mean[, 5:ncol(data)] <- lapply(data[, 5:ncol(data)], function(x) x * 40)
write.csv(data,"원래 혼잡도.csv",fileEncoding="UTF-8",row.names=FALSE)
# 대형버스 -> 좌석 25개, 수용인원 40명
# 좌석 하나 제거당 1명 수용 -> 2명 수용 가능하다고 가정

# 좌석의 25% 제거 -> 좌석 6개 제거, 수용인원  46명
crowd_del1 <- data.frame(
  노선=board_mean$노선,
  기종점=board_mean$기종점,
  순번=board_mean$순번,
  정류장명=board_mean$정류장명
)
crowd_del1[, 5:ncol(board_mean)] <- lapply(board_mean[, 5:ncol(board_mean)], function(x) x / 46)
write.csv(crowd_del1,"좌석제거 후 혼잡도(25%).csv",fileEncoding="UTF-8",row.names=FALSE)

# 좌석의 50% 제거 -> 좌석 13개 제거, 수용인원  53명
crowd_del2 <- data.frame(
  노선=board_mean$노선,
  기종점=board_mean$기종점,
  순번=board_mean$순번,
  정류장명=board_mean$정류장명
)
crowd_del2[, 5:ncol(board_mean)] <- lapply(board_mean[, 5:ncol(board_mean)], function(x) x / 53)
write.csv(crowd_del2,"좌석제거 후 혼잡도(50%).csv",fileEncoding="UTF-8",row.names=FALSE)

# 좌석의 75% 제거 -> 좌석 19개 제거, 수용인원  59명
crowd_del3 <- data.frame(
  노선=board_mean$노선,
  기종점=board_mean$기종점,
  순번=board_mean$순번,
  정류장명=board_mean$정류장명
)
crowd_del3[, 5:ncol(board_mean)] <- lapply(board_mean[, 5:ncol(board_mean)], function(x) x / 59)
write.csv(crowd_del3,"좌석제거 후 혼잡도(75%).csv",fileEncoding="UTF-8",row.names=FALSE)

# 좌석의 100% 제거 -> 좌석 25개 제거, 수용인원  65명
crowd_del4 <- data.frame(
  노선=board_mean$노선,
  기종점=board_mean$기종점,
  순번=board_mean$순번,
  정류장명=board_mean$정류장명
)
crowd_del4[, 5:ncol(board_mean)] <- lapply(board_mean[, 5:ncol(board_mean)], function(x) x / 65)
write.csv(crowd_del4,"좌석제거 후 혼잡도(100%).csv",fileEncoding="UTF-8",row.names=FALSE)

