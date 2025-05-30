rm(list=ls())

# 정규분포
# Normal distribution

# rnorm(n, mean, sd)
# 정규분포를 따르는 난수 n개 생성
rnorm(5) # 표준정규분포
rnorm(5, mean = 3, sd = 2)

# dnorm(x, mean, sd)
# 정규분포의 밀도함수
dnorm(0)
dnorm(3, mean = 3, sd = 2)

# pnorm(q, mean, sd, lower.tail)
# 정규분포의 누적분포
# P[X <= x]
pnorm(0) 
pnorm(0, lower.tail = FALSE)

pnorm(0, mean = 3, sd = 2)
pnorm(0, mean = 3, sd = 2, lower.tail = FALSE)

pnorm(1.96, mean = 0, sd = 1) - pnorm(-1.96, mean = 0, sd = 1) # P(|Z| <= 1.96)
2 * pnorm(1.96, mean = 0, sd = 1, lower.tail = F) # P(|Z| > 1.96)


# qnorm(p, mean, sd, lower.tail)
# 정규분포의 분위수 함수
qnorm(0.5)
qnorm(0.5, mean = 3, sd = 2)


# 히스토그램 그리기
set.seed(2025)
X <- rnorm(10000); X
hist(X, probability = T, main = 'X ~ N(0,1)')
t = seq(-4, 4, by = 0.01)
lines(t, dnorm(t), type = 'l')


# 이항분포의 정규근사
set.seed(2025)
a <- rbinom(n = 1000, size = 100, prob = 0.5); a # n = 100, p = 0.5
a1 <- rnorm(n = 1000, mean = 50, sd = 5); a1

# 표본에서 계산한 평균값
mean(a); mean(a1)
# 이론적인 평균 값
(100*0.5);(50)

# 표본에서 계산한 분산값
var(a); var(a1)
# 이론적인 분산 값
(100*0.5*0.5); (5^2)

par(mfrow=c(1,2))
hist(a, freq = F, main = "X~Binomial(100, 1/2)",xlim=c(30,70),ylim=c(0,0.1))
lines(density(a))
hist(a1, freq = F, main = "X~N(50,5)",xlim=c(30,70),ylim=c(0,0.1))
lines(density(a1))


x0 <- seq(0,100, by=1); x0
b <- dbinom(x = x0, size = 100, prob = 0.5); b
b1 <- dnorm(x = x0, mean = 50, sd = 5); b1

par(mfrow=c(1,1))
plot(x0, b, 'l')
points(x0, b1, type='p', col='red')


# 이항분포의 정규근사
c <- dbinom(x = 40, size = 100, prob = 0.5); c # P[X=40]
c2 <- pnorm(q = 40.5, mean = 50, sd = 5); c2 # 연속성 보정
c3 <- pnorm(q = 39.5, mean = 50, sd = 5); c3 # 연속성 보정
c2 - c3



###############################################################


# 정규분포에 대한 가정 확인
# 1. 자료의 히스토그램이 정규분포에 가까운지
par(mfrow=c(1, 1))

set.seed(2025)
X <- rnorm(50); X
hist(X, freq = F)
x0 <- seq(-3,3, by = 0.01)
lines(x0, dnorm(x = x0))

X <- rnorm(1000); X
hist(X, freq = F)
x0 <- seq(-3,3, by = 0.01)
lines(x0, dnorm(x = x0))

X <- rnorm(100000);
hist(X, freq = F)
x0 <- seq(-3,3, by = 0.01)
lines(x0, dnorm(x = x0))


# 2. 정규분포의 (평균±표준편차)에 속하는 비율
# 평균 10, 표준편차 1인 정규분포에서 1000개의 난수 샘플 생성
set.seed(2025)
X <- rnorm(1000, 10, 1)
X_bar <- mean(X); X_bar
X_sd <- sd(X); X_sd

# 평균 ±1 표준편차 안에 들어올 확률: 약 68.27%
pnorm(10+1, 10, 1) - pnorm(10-1, 10, 1)
# 실제 관측값
upper1 <- length(X[X < (X_bar + X_sd)]) / length(X); upper1
lower1 <- length(X[X < (X_bar - X_sd)]) / length(X); lower1
upper1 - lower1

# 평균 ±2 표준편차 안에 들어올 확률: 약 95.45%
pnorm(10+2, 10, 1) - pnorm(10-2, 10, 1)
upper2 <- length(X[X < (X_bar + 2*X_sd)]) / length(X); upper2
lower2 <- length(X[X < (X_bar - 2*X_sd)]) / length(X); lower2
upper2 - lower2

# 평균 ±3 표준편차 안에 들어올 확률: 약 99.73%
pnorm(10+3, 10, 1) - pnorm(10-3, 10, 1)
upper3 <- length(X[X < (X_bar + 3*X_sd)]) / length(X); upper3
lower3 <- length(X[X < (X_bar - 3*X_sd)]) / length(X); lower3
upper3 - lower3

###############################################################

# 정규확률 그림
## 데이터가 직선상에 위치해 있음 : 정규성을 따른다.
set.seed(2025)
X <- rnorm(1000, 5, 1)
qqnorm(X)
qqline(X)

