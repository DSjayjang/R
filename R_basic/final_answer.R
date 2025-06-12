

####################################################################################
# 답안은 제공된 R 스크립트에 작성 후, i-class 기말고사 과제함에 제출하시오.
# 문제 번호, OX문제, 또는 설명이 필요한 부분에 대해서는 주석(#)처리하여 작성하시오.
# R 파일의 이름은 ‘final_학번_이름’ 으로 해서 제출하시오.
####################################################################################

# 학생 명예선서(Honor Code)
# "나는 정직하게 시험에 응할 것을 서약합니다."
# 서명: 

setwd('C:\\Users\\linde\\OneDrive\\Desktop\\1. Lecture_DataScience\\1-2\\5. 기초통계실습1\\5. 시험\\기말고사')

# 1. OX 문제 [총 10점, 정답 +2점, 오답 -2점, 공백 0점]
# (a) 산점도를 통해 두 변수 간의 직선관계 뿐만 아니라, 곡선관계와 이상치 유무도 알 수 있다. (     )
# (b) 상관계수를 통해 두 변수간의 인과 관계를 알 수 있다. (     )
# (c) X ~ binomial(n,p)인 확률변수 X에 대하여, 
#     n은 충분히 크고, p는 충분히 작으면 포아송 분포로 근사할 수 있다. (     )
# (d) pnorm(x, lower.tail = F)는 표준정규분포를 따르는 확률변수 X에 대하여 P[X <= x]를 계산한다. (     )
# (e) 정규확률그림이 직선에 가까우면 모집단이 정규분포를 따른다고 가정할 수 있다. (     )
O
X
O
X
O





# 2. 표본상관계수 [총 30점]
# (a) i-class에 주어진 anscombe.csv 파일을 불러와 변수 anscombe에 저장하시오. [1점]
# (b) 변수 x1, y1 각각의 표본평균을 계산하시오. [2점]
# (c) 변수 x1, y1 각각의 편차(deviation)를 계산하시오. [2점]
# (d) 변수 x1과 y1에 대한 편차제곱합을 계산하고, 변수 Sxy, Sxx, Syy에 저장하시오. [5점]
#     (여기서 Sxx, Syy는 Sum of squares를, Sxy는 Sum of cross products를 의미.)
# (e) 변수 x1과 y1에 대한 표본상관계수를 계산하시오 (cor() 사용금지). [10점]
# (f) anscombe 데이터셋을 통해 상관계수만으로는 데이터의 특성을 완전히 파악하기 어렵다는 점을 보이시오. [10점]
anscombe <- read.csv('anscombe.csv', header = TRUE); anscombe

x1_bar <- mean(anscombe$x1); x1_bar
y1_bar <- mean(anscombe$y1); y1_bar

x1_dev <- anscombe$x1 - x1_bar; x1_dev
y1_dev <- anscombe$y1 - y1_bar; y1_dev

Sxy <- sum(x1_dev * y1_dev); Sxy
Sxx <- sum(x1_dev^2); Sxx
Syy <- sum(y1_dev^2); Syy

corr <- Sxy / sqrt(Sxx * Syy); corr

par(mfrow = c(2, 2))
plot(anscombe$x1, anscombe$y1)
plot(anscombe$x2, anscombe$y2)
plot(anscombe$x3, anscombe$y3)
plot(anscombe$x4, anscombe$y4)
cor(anscombe$x1, anscombe$y1)
cor(anscombe$x2, anscombe$y2)
cor(anscombe$x3, anscombe$y3)
cor(anscombe$x4, anscombe$y4)
par(mfrow = c(1, 1))
# 상관계수가 같더라도 실제 데이터의 분포는 다를 수 있다.






# 3. 결합 확률분포와 주변 확률분포 [총 20점]
# (a) i-class에 주어진 df.csv 파일을 불러와 변수 df에 저장하시오. [1점]
# (b) df를 이용하여 결합 확률분포를 생성하고, 변수 joint에 저장하시오. [2점]
# (c) X와 Y에 대한 주변 확률분포를 생성하고, 각각을 변수 X_margin, Y_margin에 저장하시오. [4점]
# (d) X에 대한 주변 확률분포의 기댓값을 계산하시오. [5점]
# (e) Y에 대한 주변 확률분포의 분산을 계산하시오. [8점]
df <- read.csv('df.csv', header = TRUE)

n <- nrow(df); n
joint <- table(df) / n; joint

X_margin <- margin.table(joint, margin = 1); X_margin
Y_margin <- margin.table(joint, margin = 2); Y_margin

mu_X <- sum(unique(df$X) * X_margin); mu_X 

mu_Y <- sum(unique(df$Y) * Y_margin); mu_Y # 모평균
dev_Y <- unique(df$Y) - mu_Y; dev_Y # 편차
var_Y <- sum(dev_Y^2 * Y_margin); var_Y # 모분산





# 4. 초기하분포와 이항분포 [총 20점]
# 어떤 공장에서 생산된 제품 중 1,000개 중 400개가 불량품이라고 한다.
# 이 중 임의로 10개를 검사한다고 하자. 
# 이 상황에서 불량품의 개수 확률변수 X를 고려하시오.

# (a) P[X = 5]을 계산하시오. [4점]
# (b) 초기하분포가 이항분포로 근사될 수 있다는 점을 이용하여 P[X = 5]의 값을 구하고, (a)의 값과 비교하시오. [6점]
# (c) 위 문제를 고려했을 때, 그림과 같이 출력하여 초기하분포와 이항분포가 유사함을 보이고, 어떤 조건에서 근사가 잘 되는지 설명하시오. [10점]
dhyper(x = 5, m = 400, n = 600, k = 10)

dbinom(x = 5, size = 10, prob = 0.4)

set.seed(2025)
par(mfrow=c(1,2))

hyper <- rhyper(1000, m = 400, n = 600, k = 10)
barplot(table(hyper), main = "X ~ Hypergemotric")
bin <- rbinom(1000, size = 10, prob = 0.4)
barplot(table(bin), main = "X ~ Binomial")
# 모집단 크기(N=1000)가 표본 크기(k=10)에 비해 충분히 크기 때문에 복원 추출(이항분포)로 근사해도 큰 오차가 없다.




# 5. 이항분포와 정규분포 [총 20점]
# 확률 변수 X ~ Binomial(1000, 0.6)을 고려하시오.

# (a) P[X = 590]을 계산하시오. [3점]
# (b) P[X <= a] = 0.4일 때, 이 때의 성공횟수 a를 구하시오. [3점]
# (c) P[600 <= X <= 650]을 계산하시오. (부등호에 유의할 것.) [6점]
# (d) 정규근사로 P[X = 590]을 계산하되, 연속성 수정을 적용하시오. (a)의 값과 비교하여 차이를 해석하시오. [8점]
dbinom(590, size = 1000, prob = 0.6)

qbinom(p = 0.4, size = 1000, prob = 0.6)

pbinom(650, size = 1000, prob = 0.6) - pbinom(599, size = 1000, prob = 0.6)

pnorm(q = 590.5, mean = 600, sd =  sqrt(240)) - pnorm(q = 589.5, mean = 600, sd =  sqrt(240))
# 정규분포는 연속형 확률분포인 반면, 이항분포는 이산형 확률분포이기 때문에 정확한 확률 값(P[X=590])을 계산할 수 없다.
# 따라서 연속성 수정을 적용하여 P[589.5 <= X <= 590.5]로 근사하며, 이로 인해 약간의 차이가 발생한다.








