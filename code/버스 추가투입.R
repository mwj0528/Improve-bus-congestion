# 507,741,140,463,421

setwd("C:/Users/User/Desktop/데프실_팀플")

info <- read.csv("서울시버스노선기본정보(20231114).csv")
num <- c(507,741,140,463,421)
info <- info[info[,2] %in% num, ]
info <- info[,c(2,6,7,8,9,10,11,12,13)]
info[,"시간당 운행버스 수"] <- 60/info$배차간격

# 모든 버스노선이 예비인가 차량 한대 보유
# -> 예비인가차량을 출퇴근 시간에 투입

change_info <- info
change_info$인가대수 <- change_info$인가대수+1

ratio <- c()
ratio <- info$인가대수/change_info$인가대수

change_info$배차간격 <- change_info$배차간격*ratio
change_info$`시간당 운행버스 수` <- 60/change_info$배차간격
change_info <- change_info[,c(1,2,3,10)]
 
change_count_ratio <- data.frame(
  '노선명' = change_info$노선번호,
  '배차_조정_후_버스_변화비율' = change_info$`시간당 운행버스 수`/info$`시간당 운행버스 수`,
  '배차_조정_후_탑승인원_변화비율'=2-change_count_ratio$배차_조정_후_버스_비율
)

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
change_board <- data.frame()
change_board <- board_mean[,c(1:4)]
change_board[,c(5:10)] <- board_mean[,c(5:10)]*change_count_ratio$배차_조정_후_탑승인원_변화비율

plus_bus <- data.frame(
  노선=board_mean$노선,
  기종점=board_mean$기종점,
  순번=board_mean$순번,
  정류장명=board_mean$정류장명
)
plus_bus[, 5:ncol(change_board)] <- lapply(change_board[, 5:ncol(change_board)], function(x) x / 46)
write.csv(plus_bus,"추가 배차 후 혼잡도.csv",fileEncoding="UTF-8",row.names=FALSE)





