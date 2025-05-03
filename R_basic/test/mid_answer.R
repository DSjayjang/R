

##################################################
# 답안은 제공된 R 스크립트에 작성 후, i-class 중간고사 과제함에 제출하시오.
# 문제 번호, OX문제, 또는 설명이 필요한 부분에 대해서는 주석(#)처리하여 작성하시오.
# R 파일의 이름은 ‘mid_학번_이름’ 으로 해서 제출하시오.
##################################################



# 1. OX 문제 [총 10점, 정답 +2점, 오답 -2점, 공백 0점]
# (a) 하나의 벡터의 원소들은 모두 같은 타입을 가진다. (     )
# (b) 데이터 프레임의 각 열은 서로 다른 타입을 가질 수 있다. (     )
# (c) 데이터의 퍼진 정도를 측정하는 측도로는 평균이 있다. (     )
# (d) 측정 단위가 서로 다른 자료를 비교할 때, 분산을 사용할 수 있다. (     )
# (e) 반복문에서 'next'를 만나면, 남은 반복들을 무시하고 반복문을 종료한다. (     )
O
O
X
X
X



# 2. 타입 변환 [총 10점]
# (a) 1 ~ 10 까지의 연속된 정수를 변수 num에 저장하시오. [2점]	
# (b) num 변수를 문자형 타입으로 변환하고, 변수 char에 저장하시오. [3점]
# (c) char 변수가 문자형 타입인지, 아닌지 확인하시오 (TRUE or FALSE 출력). [4점]
num <- c(1:10); num
char <- as.character(num); char
is.character(char)



# 3. R basic [총 10점]
# (a) 1 ~ 1000까지의 연속된 정수를 9를 간격으로 변수 num에 저장하시오. (예: 1, 10, …, 991, 1000) [2점]
# (b) num 변수를 내림차순 정렬하여 변수 num2에 저장하시오. [3점]
# (c) num2 변수의 원소 중, 703의 값은 몇 번째 인덱스에 있는지 출력하시오. [5점]
num <- seq(1, 1000, by = 9); num
num2 <- sort(num, decreasing = TRUE); num2
which(num2 == 703)



# 4. 결측치 [총 10점]
# 제공된 변수 vec를 사용하시오.
vec <- c(6,NA,91,97,92,8,NA,85,NA,NA,NA,15,96,71,NA,44,62,53,49,3,93,NA,46,41,NA,37,20,19,NA,81)

# (a) 결측치를 제외한 모든 수의 합을 구하시오. [2점]
# (b) 결측치의 개수를 출력하시오. [3점]
# (c) 모든 결측치를 999로 변경하고, 평균을 구하시오. [5점]
sum(vec, na.rm = T)
sum(is.na(vec))

vec[is.na(vec)] <- 999
mean(vec)



# 5. 기초통계량 [총 20점]
# 제공된 변수 data를 사용하시오.
data <- c(80,100,43,2,36,9,42,50,53,32,84,18,78,17,98,5,47,96,49,8,57,86,90,11,4,1,63,21,27,73)

# (a) 표본 평균을 계산하시오 (mean() 사용 금지). [5점]
# (b) 편차(deviation)을 계산하시오. [5점]
# (c) 표본 분산을 계산하시오 (var() 사용 금지). [5점]
# (d) 표본 표준편차를 계산하시오 (sd() 사용 금지). [5점]
x_bar <- sum(data) / length(data); x_bar; mean(data)
dev <- data - x_bar; dev
var_x <- sum(dev^2)/(length(data)-1);var_x; var(data)
sqrt(var_x); sd(data)







# 6. 데이터 프레임 [총 20점]
# (a) 바탕화면에 “test” 폴더를 만든 후, 해당 폴더를 working directory로 설정하시오. [2점]
# (b) i-class에 주어진 mtcars.csv 파일을 test 폴더에 넣고, 변수 df에 데이터를 저장하시오. [2점]
# (c) df의 차원(행과 열)을 출력하시오. [3점]
# (d) df의 mpg변수에 대해 평균과 분산을 출력하시오. [4점]
# (e) df의 qsec변수에 대해 boxplot을 출력하고, 이상치가 있는지 판단하시오. [4점]
# (f) df의 gear변수에 대해 막대그래프를 출력하시오. (단, gear 변수는 범주형 변수라 가정한다.) [5점]
setwd('C:\\Users\\user\\Desktop\\data')

df <- read.csv('mtcars.csv', header = TRUE); df

dim(df)

mean(df$mpg)
var(df$mpg)

boxplot(df$qsec)

barplot(table(df$gear))






# 7. 함수 [20점]
# 임의의 벡터 x에 대해 중앙값을 구하는 cal_median 함수를 구현하시오 (median() 사용 금지).
# 입출력 예시: 
# 입력: cal_median(c(1, 2, 3))
# 출력: 2
# 입력: cal_median(c(1, 2, 3, 4))
# 출력: 2.5

cal_median <- function(x) {
  x <- sort(x)
  n <- length(x)
  
  # 홀수
  if (n %% 2 == 1) {
    median = x[(n+1)/2]
    
    return(median)
  }
  
  # 짝수
  else {
    idx1 <- n/2
    idx2 <- n/2 + 1

    median = (x[idx1] + x[idx2]) / 2    
    
    return(median)
  }
}
