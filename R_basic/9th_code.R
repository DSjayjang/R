rm(list=ls())
# 두 변수 자료의 요약
## 두 범주형 자료의 요약: 분할표

mtcars
iris

data <- iris
head(data)

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


## 두 연속형 자료의 요약: 산점도
rm(list=ls())

height <- c(1.72, 1.80, 1.66, 1.95, 1.70, 1.50, 1.55, 1.71)
weight <- c(55, 75 ,65, 86, 80, 50, 58, 71)
plot(height, weight)

install.packages('mlbench')
library(mlbench)

head(Ozone)
cars
plot(cars$speed, cars$dist)

plot(Ozone$V8, Ozone$V9)

# x,y축의 레이블 추가
plot(Ozone$V8, Ozone$V9,
     xlab = 'temp at Sandburg', ylab = 'temp at El Monte')

# 타이틀 추가
plot(Ozone$V8, Ozone$V9,
     xlab = 'temp at Sandburg', ylab = 'temp at El Monte',
     main = 'Ozone')

# 점의 종류 변경
plot(Ozone$V8, Ozone$V9,
     xlab = 'temp at Sandburg', ylab = 'temp at El Monte',
     main = 'Ozone',
     pch = 25)

# 점의 크기 변경
plot(Ozone$V8, Ozone$V9,
     xlab = 'temp at Sandburg', ylab = 'temp at El Monte',
     main = 'Ozone',
     pch = 25, cex = 0.5)

# 점의 색상 변경
colors()
plot(Ozone$V8, Ozone$V9,
     xlab = 'temp at Sandburg', ylab = 'temp at El Monte',
     main = 'Ozone',
     pch = 25, col = 'violet')

# 좌표축의 범위
colors()
plot(Ozone$V8, Ozone$V9,
     xlab = 'temp at Sandburg', ylab = 'temp at El Monte',
     main = 'Ozone',
     pch = 25, col = 'violet',
     xlim = c(0, 100), ylim = c(0, 100))




plot(iris$Sepal.Length, iris$Sepal.Width)
plot(iris$Sepal.Length, iris$Petal.Width, main='ScatterPlot')
plot(iris$Petal.Length, iris$Petal.Width, pch=16)
plot(iris$Petal.Length, iris$Sepal.Width)

par(mfrow=c(2,2)) # 여러 그림을 한 페이지에 그리는 방법 
plot(iris$Sepal.Length, iris$Sepal.Width)
plot(iris$Sepal.Length, iris$Petal.Width)
plot(iris$Petal.Length, iris$Petal.Width)
plot(iris$Petal.Length, iris$Sepal.Width)

par(mfrow=c(1,1)) # 복구 

# 산점도 행렬
pairs(~Sepal.Length+Sepal.Width+Petal.Length+Petal.Width, data=iris)
pairs(~Sepal.Length+Sepal.Width+Petal.Length+Petal.Width, data=iris, pch=16)
pairs(~Sepal.Length+Sepal.Width+Petal.Length+Petal.Width, data=iris, pch=21,col=c(1,2,3))

pairs(~Sepal.Length+Sepal.Width+Petal.Length+Petal.Width, data=iris, 
      pch=21,col=c(1,2,3)[iris$Species])

pairs(~Sepal.Length+Sepal.Width+Petal.Length+Petal.Width, data=iris, 
      pch=c(16, 17, 18)[iris$Species],col=c(1,2,3)[iris$Species])



# 상관계수
cor(iris$Sepal.Length,iris$Petal.Width)

a <- iris$Sepal.Length-mean(iris$Sepal.Length)
Sxx <- sum(a*a);Sxx
b <- iris$Petal.Width-mean(iris$Petal.Width)
Syy <- sum(b*b);Syy
Sxy <- sum(a*b);Sxy
r <- Sxy/(sqrt(Sxx*Syy));r
plot(iris$Sepal.Length,iris$Petal.Width)

