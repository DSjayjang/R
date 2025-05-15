rm(list=ls())
set.seed(2025)

# 베르누이 시행 / 베르누이 분포
sample(c('succ', 'fail'), size = 1, prob = c(0.6, 0.4))
sample(c(1, 0), size = 1, prob = c(0.6, 0.4))


# ----------------------------------------------------------------
# ----------------------------------------------------------------

# 이항 분포 (binomial distribution)
sample(c(1, 0), size = 10, replace = T, prob = c(0.6, 0.4))
sum(sample(c(1, 0), size = 10, replace = T, prob = c(0.6, 0.4)))

rbinom(n = 1, size = 10, prob = 0.6)

# rbinom(n, size, prob)
# 이항 분포 ~bin(size, prob)를 따르는 난수 n개 생성
n_rn = 1000
n_trials = 10
p1 = 0.3
p2 = 0.5
p3 = 0.9

X <- rbinom(n = n_rn, size = n_trials, prob = p1); X
Y <- rbinom(n = n_rn, size = n_trials, prob = p2); Y
Z <- rbinom(n = n_rn, size = n_trials, prob = p3); Z

# 등장 횟수
table(X)
table(Y)
table(Z)

par(mfrow=c(1,3))
barplot(table(X))
barplot(table(Y))
barplot(table(Z))

# 이항분포의 기댓값
# E[X] = np
n_trials * p1
mean(X)

n_trials * p2
mean(Y)

n_trials * p3
mean(Z)

# 이항분포의 분산
# Var[X] = np(1-p)
n_trials * p1 * (1 - p1)
var(X)

n_trials * p2 * (1 - p2)
var(Y)

n_trials * p3 * (1 - p3)
var(Z)


# dbinom(x, size, prob)
# 성공 확률이 prob이고, size 만큼 시행했을 때 x 번 성공할 확률
dbinom(3, size = 5, prob = 0.5) # 동전을 5번 던져 앞면이 3번 나올 확률
dbinom(0:5, size = 5, prob = 0.5) # 동전을 5번 던져 앞면이 0,1,2,3,4,5번 나올 확률

############################################
## 이산형 확률 변수의 기댓값
## sum(X * P(X=x))
mu <- sum(0:5 * dbinom(0:5, size = 5, prob = 0.5)); mu
## 이항 분포의 기댓값: E[X] = np
5 * 0.5

## 이산형 확률 변수의 분산
sum((0:5 - mu)^2 * dbinom(0:5, size = 5, prob = 0.5))
## 이항 분포의 분산: Var[X] = np(1-p)
5 * 0.5 * 0.5
############################################

# 확률질량함수
barplot(dbinom(0:5, size = 5, prob = 0.5))
barplot(dbinom(0:30, size = 30, prob = 0.5))
barplot(dbinom(0:30, size = 30, prob = 0.3))
barplot(dbinom(0:30, size = 30, prob = 0.7))


# pbinom(q, size, prob, lower.tail = TRUE)
# 이항분포의 누적확률 계산
pbinom(3, size = 5, prob = 0.5) # P[X <= x]
pbinom(3, size = 5, prob = 0.5, lower.tail = FALSE) # P[X>x]
pbinom(0:5, size = 5, prob = 0.5)


# qbinom(p, size, prob, lower.tail = TRUE)
# 이항 분포의 분위수 계산
p <- pbinom(3, size = 5, prob = 0.5); p
qbinom(p, size = 5, prob = 0.5)

p <- pbinom(0:5, size = 5, prob = 0.5); p
qbinom(p, size = 5, prob = 0.5)


