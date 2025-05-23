
# 초기하 분포
# X ~ hypergeometirc(N, n, D)

# 초기하 분포를 따르는 확률변수 생성
# rhyper(nn, m, n, k)
# m: 흰 공 개수,
# n: 검은 공 개수
# k: 비복원 추출 하는 공의 수 (관심범주 : 흰 공)

X <- rhyper(nn = 100, m = 10, n = 2, k = 3); X
Y <- rhyper(nn = 100, m = 10, n = 2, k = 5); Y
Z <- rhyper(nn = 100, m = 5, n = 3, k = 5); Z

# 등장 횟수
table(X)
table(Y)
table(Z)

par(mfrow=c(1,3))
barplot(table(X))
barplot(table(Y))
barplot(table(Z))

# 초기하 분포의 기댓값
# E[X] = n*p = n*(D/N)
3 * (10/12)
mean(X)

5 * (10/12)
mean(Y)

5 * (5/8)
mean(Z)

# 초기하 분포의 분산
# Var[X] = np(1-p) = n * (D/N) * ((N-n)/(N-1))
3 * (10/12) * (1-10/12) * (9/11)
var(X)


# dhyper(x, m, n, k)
# 흰공이 m개, 검은공이 n개일 때, k개를 뽑아 x개가 흰공(성공)일 확률
# e.g. 흰 공이 10개, 검은 공이 2개일 때, 3개를 뽑아 2개가 흰 공(성공)일 확률
dhyper(2, m = 10, n = 2, k = 3) 
# e.g. 흰 공이 10개, 검은 공이 2개일 때, 3개를 뽑아 0,1,2,3개가 흰 공(성공)일 확률
dhyper(0:3, m = 10, n = 2, k = 3) 

# 확률질량함수 시각화
par(mfrow=c(1,1))
barplot(dhyper(0:5, m = 10, n = 5, k = 5))

# phyper(q, m, n, k, lower.tail = TRUE)
# 초기하 분포의 누적확률 계산 # P[X <= x]
phyper(3, m = 10, n = 5, k = 4) # P[X <= 3]
phyper(3, m = 10, n = 5, k = 4, lower.tail = FALSE) # P[X > 4]
phyper(0:4, m = 10, n = 5, k = 4)
dhyper(0:4, m = 10, n = 5, k = 4)


# qbinom(p, size, prob, lower.tail = TRUE)
# 초기하 분포의 분위수 계산
p <- phyper(3, m = 10, n = 5, k = 4); p
qhyper(p, m = 10, n = 5, k = 4)

p <- phyper(0:4, m = 10, n = 5, k = 4); p
qhyper(p, m = 10, n = 5, k = 4)


# Approximation to Binomial (n < 0.05*N)
hyper <- rhyper(nn = 1000, m = 100, n = 100, k = 5); hyper
bin <- rbinom(n = 1000, size = 5, prob = 0.5); bin
table(hyper) / 1000
table(bin) / 1000

# 초기하 분포와 이항분포의 기댓값과 분산
mean(hyper); mean(bin)
var(hyper); var(bin)


par(mfrow=c(1,1))

hyper1 <- dhyper(x = 0:5, m = 10, n = 10, k = 5); hyper1
bin1 <- dbinom(x = 0:5, size = 5, prob = 0.5); bin1
plot(0:5, hyper1, 'l')
points(0:5, bin1, type='l',col='red')

hyper2 <- dhyper(x = 0:5, m = 100, n = 100, k = 5); hyper2
bin2 <- dbinom(x = 0:5, size = 5, prob = 0.5); bin2
plot(0:5, hyper2, 'l')
points(0:5, bin2, type='l',col='red')

hyper3 <- dhyper(x = 0:5, m = 1000, n = 1000, k = 5); hyper3
bin3 <- dbinom(x = 0:5, size = 5, prob = 0.5); bin3
plot(0:5, hyper3, 'l')
points(0:5, bin3, type='l',col='red')



#####################################################################
#####################################################################
#####################################################################


# 포아송 분포
# X ~ Poisson(lambda)

# rpois(n, lambda)
# 포아송 분포를 따르는 확률변수 생성
n <- 100

X <- rpois(n = n, lambda = 3); X
Y <- rpois(n = n, lambda = 5); Y
Z <- rpois(n = n, lambda = 10); Z

# 등장 횟수
table(X)
table(Y)
table(Z)

# 포아송 분포의 기댓값
# E[X] = lambda
mean(X)
mean(Y)
mean(Z)

# 포아송 분포의 분산
# Var[X] = lambda
var(X)
var(Y)
var(Z)

# 시각화
par(mfrow=c(1,3))
barplot(table(X), main = "lambda=3")
barplot(table(Y), main = "lambda=5")
barplot(table(Z), main = "lambda=10")

# dpois(x, lambda)
# X ~ Pois(lambda)일 때, P[X = x]일 확률
dpois(4, lambda = 3) # X ~ Pois(3)일 때, P[X = 4]
dpois(7, lambda = 5) # X ~ Pois(5)일 때, P[X = 7]

# ppois(q, lambda, lower.tail = TRUE)
# X ~ Pois(lambda)일 때, P[X <= x]일 확률
ppois(5, lambda = 3) # X ~ Pois(3)일 때, P[X <= 5]
ppois(5, lambda = 3, lower.tail = FALSE) # X ~ Pois(3)일 때, P[X > 5]

# qpois(p, lambda, lower.tail = TRUE)
# 포아송 분포의 분위수 계산
p <- ppois(5, lambda = 3); p
qpois(p, lambda = 3)


# Approximation to Poisson(m -> infty, p -> 0)
# e.g.
# 하루 동안 3,000명이 복권을 샀을 때, 당첨될 확률이 0.002인 경우,
# X ~ bin(3000, 0.002)
# Y ~ pois(6)
dbinom(5, 3000, 0.002)
dpois(5, 6)


par(mfrow=c(1,1))

pois1 <- dpois(x = 0:10, lambda = 3); pois1
bin1 <- dbinom(x = 0:10, size = 10, prob = 3/10); bin1
plot(0:10, pois1, 'l')
points(0:10, bin1, type='l', col = 'red')

pois2 <- dpois(x = 0:10, lambda = 3); pois2
bin2 <- dbinom(x = 0:10, size = 100, prob = 3/100); bin2
plot(0:10, pois2, 'l')
points(0:10, bin2, type='l', col = 'red')

pois3 <- dpois(x = 0:10, lambda = 3); pois3
bin3 <- dbinom(x = 0:10, size = 1000, prob = 3/1000); bin3
plot(0:10, pois3, 'l')
points(0:10, bin3, type='l', col = 'red')

