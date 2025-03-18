rm(list=ls())

# 행렬 (matrix)
## 데이터 정의
data <- c(1, 2, 3, 4, 5, 6)

## 행렬 생성
mat <- matrix(data, nrow = 2)
mat

mat2 <- matrix(data, nrow= 2, byrow = TRUE)
mat2

mat3 <- matrix(data, ncol = 2)
mat3

mat4 <- matrix(data, ncol = 2, byrow = TRUE)
mat4


## 행렬의 이름 설정1
rownames(mat4) <- c('r1', 'r2', 'r3')
colnames(mat4) <- c('c1', 'c2')
mat4

## 행렬의 이름 설정2
rnames <- c('r1', 'r2')
cnames <- c('c1', 'c2', 'c3')

mat5 <- matrix(data, nrow = 2, dimnames = list(rnames, cnames))
mat5


## 행렬 인덱싱
mat

mat[1, 1] # 1행 1열
mat[1, 2] # 1행 2열
mat[2, 1] # 2행 1열
mat[2, 3] # 2행 3열

mat[1, ] # 1행 전체 출력
mat[, 2] # 2열 전체 출력

mat[, c(1, 3)] # 1열, 3열 전체 출력

mat[, -2] # 2번째 열은 제외하고 출력



# 리스트 (list)
x <- list(name = 'foo', height = c(1, 3, 5))
x

## 리스트 요소 접근
### 키(key) 또는 인덱스를 통해 (키, 값)에 접근
x[1]
x[2]
x['name']

### 키(key)를 통해 값(value)에 접근
x$name
x$height

### 키(key)의 또는 인덱스를 통해 값(value)에 접근
x[[1]]
x[[2]]
x[['name']]
x[[2]][1]
x[[2]][2]


## 리스트 요소 추가 및 삭제
x$mat <- matrix(c(1,2,3,4), nrow = 2)
x

x$mat <- NULL
x


# 데이터 프레임 (data frame)
df <- data.frame(x = c(1, 2, 3, 4, 5),
                 y = c(2, 4, 6, 8, 10),
                 z = c('M', 'F', 'M', 'F', 'M'))

## 데이터 프레임의 차원 확인
dim(df) # 행, 열
nrow(df) # 행의 개수
ncol(df) # 열의 개수

## 데이터 프레임의 구조 확인
str(df)

## 데이터 프레임 인덱싱
df$x
df$y
df$z

df[1, ] # 1행
df[, 1] # 1열



# 작업 공간 설정
## 현재 작업 중인 경로 확인
getwd()

## 작업할 경로 재설정
setwd('C:\\Users\\linde\\OneDrive\\Desktop\\1. Lecture_DataScience\\1-2\\5. 기초통계실습1\\2. 강의자료\\3rd')
getwd()


# R에서의 파일 입출력
list.files('./') # 현재 경로에 있는 파일 확인

## csv 파일 입출력
### 입력
data <- read.csv(file = 'data.csv', header = T)
data

### 출력
write.csv(data, file = 'new_data.csv')
write.csv(data, file = 'new_data.csv', row.names = F)


## 텍스트(txt) 파일 입출력
### 입력

data2 <- read.table(file = 'data.txt', header = TRUE, sep = '\t')
data2

data3 <- read.table(file = 'data.txt', header = FALSE)
data3

readLines("data.txt")

### 출력
write.table(data, file = 'new_data.txt', sep = ',')
write.table(data, file = 'new_data2.txt', sep = ',', quote = FALSE)
write.table(data, file = 'new_data3.txt', sep = ',', quote = FALSE, row.names = F)

