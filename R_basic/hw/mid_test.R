# 중간고사 문제.

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

# 2. 타입 변환 [총 5점]
# (a) 1 ~ 10 까지의 연속된 정수를 num 변수에 저장하시오. [1점]
# (b) num 변수를 문자형 타입으로 변환하고, char 변수에 저장하시오. [2점]
# (c) char 변수가 문자형 타입인지, 아닌지 확인하시오 (TRUE or FALSE 출력).  [2점]
num <- c(1:10); num
char <- as.character(num); char
is.numeric(char)


# 3. R basic [총 10점]
# (a) 1 ~ 1000까지의 연속된 정수를 9를 간격으로 num 변수에 저장하시오. [2점]
# (b) num 변수를 내림차순 정렬하여 num2 변수에 저장하시오. [3점]
# (c) 변수 num2의 원소 중, 703의 값은 몇 번째 인덱스에 있는지 출력하시오. [5점]
num <- seq(1, 1000, by = 9); num
num2 <- sort(num, decreasing = TRUE); num2
which(num2 == 703)


# 최빈값 출력함수 만들기??
# 또는 최빈값이 중복될때 모든 값을 출력하도록 하기
# 이건 which.max가 아니라 table(mode2)[table(mode2) == max(table(mode2))] 이런식으로 해야함함


# 6. 결측치 [총 10점]
# (a)

# 7. 데이터 프레임 [총 20점]
# (a) 바탕화면에 data 폴더를 만든 후, 해당 폴더를 working directory로 설정하시오. [4점]
# (b) 중간고사 과제함에 주어진 ~~.csv 파일을 data 폴더에 넣고, df 변수에 데이터를 저장하시오. [4점]
# (c) df의 차원(행과 열)을 출력하시오. [3점]
# (d) df의 ~ 변수에 대해 평균을 출력하시오. [3점]
# (e) df의 ~ 변수에 대해 분산을 출력하시오. [3점]
# (f) df의 ~ 변수에 대해 표준편차를 출력하시오. [3점]
