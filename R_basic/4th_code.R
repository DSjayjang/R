rm(list = ls())

getwd()
setwd('C:\\Users\\linde\\Desktop\\Lecture\\1-2\\5. 기초통계실습1\\2. 강의자료')

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
    print(paste('i=', i, '는 10 이상'))
  }
  else{
    print(paste('i=', i, '는 10 미만'))
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
  if(i %% 2 != 0){
    print(i) # 2로 나눈 나머지가 0이 아닌 경우. 즉, 홀수
  }
  i <- i + 1
}

## 구구단
for(i in 1:9){
  print(paste0(i, "단 시작"))
  
  for(j in 1:9){
    print(paste(i, "*", j, "=", i*j))
  }
}


# next
i <- 0

while(i <= 10){
  i <- i + 1
  if(i %% 2 != 0){
    next
  }
  print(i)
}







