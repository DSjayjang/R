# 베르누이 분포 (bernoulli distribution)

# 이항 분포 (binomial distribution)
n_rv = 1000
n_trials = 10
p1 = 0.3
p2 = 0.5
p3 = 0.9

set.seed(1234)
X <- rbinom(n = n_rv, size = n_trials, prob = p1); X
Y <- rbinom(n = n_rv, size = n_trials, prob = p2); Y
Z <- rbinom(n = n_rv, size = n_trials, prob = p3); Z

# 등장 횟수
table(X)
table(Y)
table(Z)

# 기댓값
# E[X] = np
mean(X)
n_trials * p1

mean(Y)
10 * 0.5

mean(Z)
10 * 0.9

# 분산
# Var[X] = np(1-p)
var(X)
10 * 0.3 * 0.7

var(Y)
10 * 0.5 * 0.5

var(Z)
10 * 0.9 * 0.1
