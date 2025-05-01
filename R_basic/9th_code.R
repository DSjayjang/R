rm(list=ls())

# 두 범주형 자료의 요약: 분할표
data = data.frame(x = sample(c('a1', 'a2', 'a3'), 200, replace = T),
                  y = sample(c('b1', 'b2'), 200, replace = T))
data

## 변수 하나에 대한 표 (도수분포표)
mytable = table(data$x); mytable
prop.table(mytable)

## 변수 두개에 대한 표 (분할표)
mytable = table(data$x, data$y); mytable

## 비율로 표시하기
prop.table(mytable)
prop.table(mytable, margin = 1) # 각 행에서 차지하는 비율
prop.table(mytable, margin = 2) # 각 열에서 차지하는 비율

## margin 추가
addmargins(mytable)
margin.table(mytable, margin = 1) # 첫 번째 변수의 margin table
margin.table(mytable, margin = 2) # 두 번째 변수의 margin table

## 모자이크 플랏
mosaicplot(mytable, color = TRUE)
mosaicplot(~Class + Survived, data = Titanic, color = TRUE)


# 두 연속형 자료의 요약: 산점도
## 데이터 불러오기
setwd('~~')
cars <- read.csv('cars.csv', header = TRUE)

## 데이터 확인
head(cars)
str(cars)
summary(cars)


## 변수 x, y
x <- cars$speed; x
y <- cars$dist; y


# 산점도 출력
plot(x, y)

# x,y축의 레이블 추가
plot(x, y,
     xlab = 'speed', ylab = 'distance')

# 타이틀 추가
plot(x, y,
     xlab = 'speed', ylab = 'distance',
     main = 'Speed and Stopping Distance of Cars')

# 점의 종류 변경
plot(x, y,
     xlab = 'speed', ylab = 'distance',
     main = 'Speed and Stopping Distance of Cars',
     pch = 25)

# 점의 크기 변경
plot(x, y,
     xlab = 'speed', ylab = 'distance',
     main = 'Speed and Stopping Distance of Cars',
     pch = 19, cex = 1.5)

# 점의 색상 변경
colors()
plot(x, y,
     xlab = 'speed', ylab = 'distance',
     main = 'Speed and Stopping Distance of Cars',
     pch = 25, cex = 1.5, col = 'violet')

# 좌표축의 범위
plot(x, y,
     xlab = 'speed', ylab = 'distance',
     main = 'Speed and Stopping Distance of Cars',
     pch = 25, cex = 1.5, col = 'violet',
     xlim = c(0, 30), ylim = c(0, 150))

## 산점도 행렬
pairs(cars)
pairs(iris)


# 표본상관계수
x <- cars$speed; x
y <- cars$dist; y

cor(x, y)

## 표본상관계수 직접 계산하기
# 1. 평균
x_bar <- mean(x); x_bar
y_bar <- mean(y); y_bar

# 2. 편차
x_dev <- x - x_bar; x_dev
y_dev <- y - y_bar; y_dev

# 3. 편차제곱합
Sxy <- sum(x_dev * y_dev); Sxy
Sxx <- sum(x_dev^2); Sxx
Syy <- sum(y_dev^2); Syy

# 4. 표본상관계수
corr <- Sxy / sqrt(Sxx * Syy)

# 결과 확인
corr; cor(x, y)

## 상관관계는 반드시 산점도와 함께 확인해야 한다.
## 예) anscombe의 데이터셋
anscombe

attach(anscombe)

par(mfrow = c(2, 2))
plot(x1, y1)
plot(x2, y2)
plot(x3, y3)
plot(x4, y4)

cor(x1, y1)
cor(x2, y2)
cor(x3, y3)
cor(x4, y4)

detach(anscombe)

par(mfrow = c(1, 1))


# End