# 수치를 통한 연속형 자료의 요약

# 중심위치의 측도 (평균)
sample <- c(89, 74, 91, 88, 72, 84); sample

sum(sample) / length(sample)
mean(sample)


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
(length(sample_odd)+1) / 2 # n/2번째 인덱스
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
sample <- c(89, 74, 91, 88, 72, 84); sample

# 방법1
var(x)

# 방법2
x_bar <- mean(x);x_bar
dev <- x-x_bar; dev

sum(dev) # 편차의 합 = 0

#편차 제곱의 합 / (n-1) (아래 코드 모두 동일)
sum(dev*dev)/(length(dev)-1)
sum(dev^2)/(length(dev)-1)
(dev %*% dev)/(length(dev)-1)
sum(dev * dev)

# 방법3 (아래 코드 모두 동일)
(sum(x*x)-length(x)*(x_bar)^2)/(length(x)-1)
(sum(x^2)-length(x)*(x_bar)^2)/(length(x)-1)
((x %*% x)-length(x)*(x_bar)^2)/(length(x)-1)


# 방법4 (아래 코드 모두 동일)
(sum(x*x)-(sum(x))^2/length(x))/(length(x)-1)
(sum(x^2)-(sum(x))^2/length(x))/(length(x)-1)
(x %*% x-(sum(x))^2/length(x))/(length(x)-1)

 