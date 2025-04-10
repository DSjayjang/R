# 수치를 통한 연속형 자료의 요약

# 중심위치의 측도 (평균)
sample <- c(89, 74, 91, 88, 72, 84); sample
mean(sample)

## 평균 직접 계산하기
sum(sample) / length(sample)



# 중심위치의 측도 (중앙값)
## 샘플의 개수가 홀수인 경우
sample_odd <- c(89, 74, 91, 88, 72); sample_odd
median(sample_odd)

## 샘플 개수가 짝수인 경우
sample_even <- c(89, 74, 91, 88, 72, 84); sample_even
median(sample_even)

## 중앙값 직접 계산하기
### 홀수인 경우
sort(sample_odd) # 데이터 정렬
(length(sample_odd) + 1) / 2 # n/2번째 인덱스
sort(sample_odd)[(length(sample_odd) + 1) / 2] # 중앙값

### 짝수인 경우
sort(sample_even) # 데이터 정렬
idx1 <- length(sample_even) / 2; idx1 # n/2번째 인덱스
idx2 <- length(sample_even) / 2 + 1; idx2 # n/2 + 1번째 인덱스

(sort(sample_even)[idx1] + sort(sample_even)[idx2]) / 2 # 중앙값



# 중심위치의 측도 (최빈값)
## 예제 1
mode1 <- c(rep('a', 5), rep('b', 10), rep('c', 2)); mode1
table(mode1) # 빈도수 계산
max(table(mode1)) # 최빈값 출력

### 최빈값을 가지는 범주와 인덱스 출력
which(table(mode1) == max(table(mode1)))
which.max(table(mode1))

### 최빈값을 가지는 범주와 값 출력
table(mode1)[table(mode1) == max(table(mode1))]
table(mode1)[which.max(table(mode1))]

### 최빈값을 가지는 범주 출력
names(table(mode1)[which(table(mode1) == max(table(mode1)))]) 

## 예제 2
mode2 <- c(rep('a', 5), rep('b', 5), rep('c', 2)); mode2
table(mode2) # 빈도수 계산
max(table(mode2)) # 최빈값 출력, 먼저 나온 값 하나만 출력!

### 최빈값을 가지는 범주와 인덱스 출력
which(table(mode2) == max(table(mode2)))
which.max(table(mode2))

### 최빈값을 가지는 범주와 값 출력
table(mode2)[table(mode2) == max(table(mode2))]
table(mode2)[which.max(table(mode2))]

### 최빈값을 가지는 범주 출력
names(table(mode2)[which(table(mode2) == max(table(mode2)))]) 



# 퍼진 정도의 측도 (표본분산)
x <- c(89, 74, 91, 88, 72, 84); x
var(x)

## 분산 직접 계산하기
n = length(x)
x_bar <- mean(x); x_bar # 평균
dev <- x - x_bar; dev # 편차
sum(dev) # 편차의 합=0
sum(dev^2) / (n-1) # 분산 = 편차의 제곱합/(n-1)



# 퍼진 정도의 측도 (표본 표준편차)
x <- c(89, 74, 91, 88, 72, 84); x
sd(x)
sqrt(var(x)) # 분산의 양의 제곱근



# 퍼진 정도의 측도 (범위)
x <- c(89, 74, 91, 88, 72, 84); x
range(x) # 최솟값과 최댓값을 출력
range(x)[2] - range(x)[1] # 범위

## 범위 직접 계산하기
max(x) - min(x)



# 백분위수 (percentile)
x <- c(5, 8, 12, 15, 18, 22, 25, 29, 33, 37)
quantile(x, prob = 0.25) # 제 25 백분위수
quantile(x, prob = 0.75) # 제 75 백분위수
quantile(x, prob = seq(0.1, 1.0, by = 0.1))

n = length(x)
p = 0.75
floor(n*p) # 정수 부분
x[floor(n*p) + 1] # 제 75 백분위수
quantile(x, prob = 0.75, type = 2) # 제 75 백분위수



# 사분위수 (quartile)
x <- c(5, 8, 12, 15, 18, 22, 25, 29, 33, 37)
quantile(x)
quantile(x, prob = c(0.25, 0.5, 0.75))

## 사분위수 범위(IQR)
IQR(x)
quantile(x)
quantile(x)[4] - quantile(x)[2]
quantile(x,prob = 0.75) - quantile(x,prob = 0.25)



# 변동계수(CV)
x1 <- c(170, 180, 175, 188, 177, 173); x1 # 키(cm)
x2 <- c(1.70, 1.80, 1.75, 1.88, 1.77, 1.73); x2 # 키(m)
x3 <- c(60, 68, 67, 80, 77, 70); x3 # 몸무게(kg)

cv_x1 <- (sd(x1) / mean(x1)) * 100; cv_x1
cv_x2 <- (sd(x2) / mean(x2)) * 100; cv_x2
cv_x3 <- (sd(x3) / mean(x3)) * 100; cv_x3 # 키에 비해 몸무게는 개인차가 심하다.



# 상자그림(boxplot)
## 하나의 상자그림 그리기
x <- c(42,40,38,37,43,39,78,38,45,44,40,38,41,35,31,44); x
?boxplot(x)


## 여러 개의 상자그림 그리기
iris
head(iris)

boxplot(Sepal.Width ~ Species, data = iris, col = c(3,4,5),
        main = 'Boxplot of Sepal.Width by Species',
        ylim = c(0, 5), ylab = 'Sepal.Width',
        names = c('Setosa', 'Versicolor', 'Viorginica'))


