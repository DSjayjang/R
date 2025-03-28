rm(list = ls())

# 벡터 연산
x <- c(1, 2, 3)
y <- c(1, 2, 5)

x + 2
x / 3
x * 4

x + y
x * y

x == c(1, 2, 5)
x == c(1, 2, 5, 6)
x == c(1, 2, 5, 6, 2, 8)

range(x)
max(x)
sum(x)
prod(x)
mean(x)
var(x)
sd(x)

# 벡터 정렬
x <- c(5,2,1,3,4,7)

sort(x) # 오름차순 
sort(x, decreasing = TRUE) # 내림차순

order(x)
x[order(x)]


# 행렬 연산
mat <- matrix(x, nrow = 2)
mat

mat + 1
mat / 3
mat * 4
mat + mat

t(mat) # 전치 행렬
mat %*% t(mat) # 행렬곱


# apply 함수
apply(mat, MARGIN = 1, FUN = sum) # 행별 합계
apply(mat, MARGIN = 2, FUN = sum) # 열별 합계

apply(mat, MARGIN = 1, FUN = mean) # 행별 평균
apply(mat, MARGIN = 2, FUN = mean) # 열별 평균


# 결측치
a = c(1, NA, 3, 4, NA)
is.na(a)

sum(a)
sum(a, na.rm = T)


## 결측치 대치
which(is.na(a)) # which는 TRUE인 인덱스를 반환
a[which(is.na(a))] = 5
a

## 결측치 제거
b = c(1, NA, 3, 4, NA)
b

c <- na.omit(b) # 결측치 제거
c

d <- as.vector(na.omit(b)) # 벡터 타입으로 정의
d


# 조건문과 반복문
## 조건문 (if)
grade <- 75

if (grade >= 70){
  print('합격')
} else {
  print('불합격')
}

grade2 <- 65

if (grade2 >= 80){
  print('A')
} else if (grade2 >= 70){
  print('B')
} else if (grade2 >= 60){
  print('C')
} else{
  print('D')
}


## 반복문 (for)
for(i in 1:5){
  print(i)
}

## 반복문과 조건문
vec <- c(10, 22, 3, 15, 8, 5)

for(i in vec){
  if(i >= 10){
    print('10 이상')
  }
  else{
    print('10 미만')
  }
}

for(i in vec){
  if(i >= 10){
    print(paste(i, '는 10 이상'))
  }
  else{
    print(paste(i, '는 10 미만'))
  }
}


## 반복문 (while)
var <- 1

while (var <= 10){
  print(var)
  
  var <- var + 1
}


i <- 1

while (i <= 10){
  if((i %% 2) != 0){
    print(i) # 2로 나눈 나머지가 0이 아닌 경우. 즉, 홀수
  }
  i <- i + 1
}

## 구구단 2단
for(i in 1:9){
  print(paste(2, "x", i, "=", 2*i))
}


# next
i <- 0

while(i <= 10){
  i <- i + 1
  
  if(i %% 2 != 0){
    next # 홀수는 건너띔
    print(i)
  }
  
  print(i)
}

# break
for(i in 1:10){
  if(i == 5){
    break
  }
  print(i)
}


# 함수 (function)
## 덧셈 함수
add <- function(num1, num2){
  return (num1 + num2)
}

add(1, 2) # 1+2
add(5, 3) # 5+3

## 구구단 함수
gugu <- function(num){
  for(i in 1:9){
    print(paste(num, "x", i, "=", num*i))
  }
}

gugu(2) # 구구단 2단
gugu(8) # 구구단 8단