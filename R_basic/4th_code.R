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