rm(list=ls())

# 두 변수 자료의 요약
## 두 범주형 자료의 요약: 분할표
write.csv(cars, 'cars.csv', row.names = F)
write.csv(iris, 'iris.csv', row.names = F)


setwd('C:\\Users\\linde\\Desktop\\Lecture\\1-2\\5. 기초통계실습1\\2. 강의자료')
iris <- read.csv('iris.csv', header = TRUE)

## 데이터 확인
head(iris)
dim(iris)
str(iris)
summary(iris)

## 데이터 전처리


data$Sepal.Length < 6

#Sepal.Length_6이라는 이름의 범주형 변수
#Sepal.Length가 6이상이면 High, 6미만이면 Low를 가지는 범주형 변수 추가
data$Sepal.Length_6 <- 'High'
head(data)

data$Sepal.Length_6[data$Sepal.Length<6] <- 'Low'  
data$Sepal.Length_6

#iris 데이터의 각 변수에 어떤 값들이 있는지 확인
unique(data$Species)
unique(data$Sepal.Length_6)

table(data$Species) # 이전까지 배웠던 도수분포표 형태
tab <- table(data$Species, data$Sepal.Length_6)
tab
prop.table(tab)

# 모자이크 플롯
mosaicplot(tab, main='Species vs. Sepal.Length_6', color=c('grey','black'))


# 두 연속형 자료의 요약: 산점도
## 데이터 불러오기
setwd('C:\\Users\\linde\\Desktop\\Lecture\\1-2\\5. 기초통계실습1\\2. 강의자료')
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
     pch = 25, cex = 1.5)

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

# 산점도 행렬
pairs(~speed + dist, data = cars)
pairs(~Sepal.Length + Sepal.Width + Petal.Length + Petal.Width, data = iris)



# 상관계수
cor(x, y)

## 상관계수 직접 계산하기
# 1. 평균
x_bar <- mean(x); x_bar
y_bar <- mean(y); y_bar

# 2. 편차
x_dev <- x - x_bar; x_dev
y_dev <- y - y_bar; y_dev

# 3. 편차제곱합
Sxx <- sum(x_dev^2); Sxx
Syy <- sum(y_dev^2); Syy
Sxy <- sum(x_dev * y_dev); Sxy

# 4. 상관계수
corr <- Sxy / sqrt(Sxx * Syy)

# 결과 확인
corr; cor(x, y)

